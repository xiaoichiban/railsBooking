# README

This project was generated with Ruby on Rails - Ruby version 2.7.2 and Rails 6.1.3.

## System dependencies

Ruby
SQLite3
Node.js
Yarn

Refer [Rails start up](https://guides.rubyonrails.org/getting_started.html) for more information on the installation and dependencies.

## Installing Gems

Run `bundle install` to install all gem files.

## Configuration for database setup and data creation

Run `rails db:setup` to load setup data. Refer to `db/seeds.db` for preload data.

## Development server

Run `rails s` for a dev server. Navigate to `http://localhost:3000/`. The app will automatically reload if you change any of the source files.

## Accounts Login

`Admin: email- admin@gmail.com, password: password`
`User: tom@gmail.com, password: password`

Refer to `db/seeds.db` for more details.


* Admin special functionalities

Only `Admin` is able to carry out facilities and timeslot management (Create and Edit).
`Admin` are also able to view all bookings made by other users.