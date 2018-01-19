# encoding: utf-8

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

# Test users.
# Notes:
#  - Password minimum length is 8 charactes (see config/initializers/devise.rb)
#  - Do not use in production, and use better passwords :)

User.create(email: 'ccarrodupla@gmail.com',   password: 'password')
User.create(email: 'lucas@citrusbyte.com',    password: 'password')
User.create(email: 'federico@citrusbyte.com', password: 'password')
User.create(email: 'lautaro@citrusbyte.com',  password: 'password')
User.create(email: 'test@example.com',        password: 'password')
