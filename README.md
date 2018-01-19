Devices and Sensors Exercise
============================

Rails application.

Ruby 2.4.1

Some seed data has been added (see `db/seeds.rb`)

The REST API has one entry point at `/api/v1/notify`, and it can be tested with CURL. For example if there is a device with serial number `123456789012`, an example it could be:

    curl -H "Content-Type: application/json" localhost:3000/api/v1/notify -d \
    '{"device_serial":"123456789012","sensor_data":[{"temperature":23,"humidity":90,"co_level":0,"health":"ok","recorded_at":"2018/01/10 12:34"}]}'


`January 2018`
