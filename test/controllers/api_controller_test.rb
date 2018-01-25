require 'test_helper'

class ApiControllerTest < ActionController::TestCase

  def setup
    # Get a random device's serial number through the fixtures:
    @device_serial    = Device.all.sample.serial_number
    @initial_num_data = SensorDatum.count
    # And some data to send to the API:
    sensor_datum  = SensorDatum.all.sample
    @sensor_datum = { temperature:  sensor_datum.temperature,
                      humidity:     sensor_datum.air_humidity,
                      co_level:     sensor_datum.co_level,
                      health:       sensor_datum.device_health,
                      recorded_at:  sensor_datum.created_at }
  end

  test 'notify should be able to receive 1 unit of sensor data' do
    post :notify, {device_serial: @device_serial, sensor_data: [@sensor_datum]}
    assert_response :success
    assert_equal SensorDatum.count, @initial_num_data + 1
  end

  test 'notify should respond 422 if no sensor data is received' do
    post :notify, {device_serial: @device_serial, sensor_data: []}
    assert_response 422
    assert_equal SensorDatum.count, @initial_num_data
  end

  test 'notify should be able to receive sensor data, and respond as "success" as far as some data is valid' do
    bad_datum = @sensor_datum.dup
    bad_datum[:co_level] = -10
    post :notify, {device_serial: @device_serial, sensor_data: [@sensor_datum, bad_datum]}
    assert_response :success
    assert_equal SensorDatum.count, (@initial_num_data + 1)
  end

  test 'notify should respond 422 if no valid sensor data is sent' do
    sensor_datum = SensorDatum.all.sample
    @sensor_datum[:co_level] = -100   # Invalid
    post :notify, {device_serial: @device_serial, sensor_data: [@sensor_datum]}
    assert_response 422
  end

  test 'notify should not add more than 500 units of valid sensor data' do
    sensor_data = [@sensor_datum]*505
    post :notify, {device_serial: @device_serial, sensor_data: sensor_data}
    assert_response :success
    assert_equal SensorDatum.count, (@initial_num_data + 500)
  end

end
