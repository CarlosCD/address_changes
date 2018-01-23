Devices and Sensors Exercise
============================

- Rails application.
- Ruby 2.4.0
- PostgreSQL (tested with PostgreSQL 9.6.1.1)

Some seed data has been added (see `db/seeds.rb`)

A test of this application is running in [Heroku](https://blooming-sierra-75455.herokuapp.com/) (production environment),

### REST API

The REST API has one entry point at `/api/v1/notify`, and it can be tested with CURL. For example if there is a device with serial number `123456789012`, an example it could be:

    curl -H "Content-Type: application/json" localhost:3000/api/v1/notify -d \
    '{"device_serial":"123456789012","sensor_data":[{"temperature":23,"humidity":90,"co_level":0,"health":"ok","recorded_at":"2018/01/10 12:34"}]}'

### Some screenshots

Devices index in the dashboard:

![Devices](https://raw.githubusercontent.com/CarlosCD/exer-sensors/master/doc/devices_index.png)

A device with its data (dashboard too):

![Sensor Data](https://raw.githubusercontent.com/CarlosCD/exer-sensors/master/doc/devices_show.png)

API from the command line (on the development environment):

![API from CURL](https://raw.githubusercontent.com/CarlosCD/exer-sensors/master/doc/api_access_from_curl.png)

Users index in the dashboard:

![Devices](https://raw.githubusercontent.com/CarlosCD/exer-sensors/master/doc/users_index.png)

Log in to the dashboard:

![Devices](https://raw.githubusercontent.com/CarlosCD/exer-sensors/master/doc/log_in.png)



`January 2018`
