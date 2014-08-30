require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "populate database"
task "db:populate" do
  require 'populator'
  require 'faker'

  Store.populate 1 do |store|
    store.store_name = "Starbucks"
    store.store_label = "4325"
  end

  Employee.populate 15 do |person|
    person.employee_number = Faker::Internet.user_name
    person.first_name = Faker::Name.first_name
    person.last_name = Faker::Name.last_name
    person.phone = Faker::PhoneNumber.phone_number
    person.role = "barista"
    person.password = "password"
    person.address = Faker::Address.street_address
    person.store_id = 1
  end

  Employee.populate 5 do |person|
    person.employee_number = Faker::Internet.user_name
    person.first_name = Faker::Name.first_name
    person.last_name = Faker::Name.last_name
    person.phone = Faker::PhoneNumber.phone_number
    person.role = "manager"
    person.password = "password"
    person.address = Faker::Address.street_address
    person.store_id = 1
  end

  from_date = DateTime.new(2014, 8, 29, 6, 00, 00)
  to_date = DateTime.new(2014, 9, 29, 6, 00, 00)

  (from_date..to_date).each do |date|
    Shift.populate 2 do |shift|
      shift.start_date = from_date
      shift.end_date = from_date + Rational(5, 24)
      shift.employee_id = 1..15
      shift.store_id = 1
    end
    Shift.populate 2 do |shift|
      shift.start_date = from_date + Rational(5, 24)
      shift.end_date = from_date + Rational(10, 24)
      shift.employee_id = 1..15
      shift.store_id = 1
    end
    Shift.populate 2 do |shift|
      shift.start_date = from_date + Rational(10, 24)
      shift.end_date = from_date + Rational(15, 24)
      shift.employee_id = 1..15
      shift.store_id = 1
    end
    Shift.populate 1 do |shift|
      shift.start_date = from_date + Rational(2, 24)
      shift.end_date = from_date + Rational(11, 24)
      shift.employee_id = 16..20
      shift.store_id = 1
    end
    from_date += 1
  end
end
