class ApiController < ApplicationController

  # REST API Endpoint.
  # Expected data:
  #  { device_serial: 'XXX',
  #    sensor_data: [ {
  #                     temperature:   xxx.xx,
  #                     humidity:      xxx.xx,
  #                     co_level:      xx,
  #                     health:       'XXX'
  #                     recorded_at:  'YYYY/MM/DD HH:MM ...'
  #                   }
  #                   ...
  #                 ]
  #    }
  # sensor_data could be an array of 1-500 elements.
  # If more that 500, omnly the first 500 will be considered.
  # Invalid data will be ignored (in the future we could consider to alert admin users)
  #
  # Example for testing the API:
  #
  #   curl -H "Content-Type: application/json" localhost:3000/api/v1/notify -d '{"device_serial":"123456789012","sensor_data":[{"temperature":23,"humidity":90,"co_level":0,"health":"ok","recorded_at":"2018/01/10 12:34"}]}'
  #
  def notify
    params.permit(:device_serial, sensor_data: [])
    device = Device.where(serial_number: params[:device_serial]).first
    if device && params[:sensor_data].is_a?(Array)
      data_received = params[:sensor_data][0..499]
      num_added = 0
      data_received.each do |data|
        begin
          result = SensorDatum.create!(device: device, created_at: data[:recorded_at],
                                       temperature: data[:temperature], air_humidity: data[:humidity],
                                       co_level: data[:co_level],       device_health: data[:health])
          num_added += 1
        rescue Exception => e
          # We will ignore malformed data for now.
          #
          # puts
          # puts '------------------'
          # puts"ERROR: #{e}"
          # puts '------------------'
          # puts
        end
      end
      if num_added > 0
        render json: {message: "Added #{num_added} sensor data points for device #{device.serial_number}"}, status: :ok
      else
        render json: {message: 'Not valid data received'}, status: 422
      end
    else
      render json: {message: 'Data missing'}, status: 422
    end
  end

  private
  
  def set_params
    params.permit(:device_serial, :sensor_data)
  end

end
