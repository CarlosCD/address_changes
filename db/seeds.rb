# Some seed data to demo the application's dashboard
#
# Run rake db:seed to add it to the database (or create it alongside the db with rake db:setup).

Device.create( serial_number: '123456789012', firmware: '1.01')
Device.create( serial_number: '123456789013', firmware: '1.03')

Device.all.each do |d|
  5.times do
    d.sensor_data << SensorDatum.new( temperature:  [20, 23, 15, 30.45].sample,
                                      air_humidity: [30, 50, 60.5, 100].sample,
                                      co_level: [0, 1, 5, 9, 10].sample,
                                      device_health: ['unknown', 'good', 'ok'].sample )
  end
end
