Store.populate 1 do |store|
  store.store_name = "Starbucks"
  store.store_label = "4325"
end

Employee.populate 35 do |person|
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
    shift.start_time = from_date
    shift.duration = 300
    shift.employee_id = 1..35
    shift.store_id = 1
  end
  Shift.populate 2 do |shift|
    shift.start_time = from_date + Rational(5, 24)
    shift.duration = 300
    shift.employee_id = 1..35
    shift.store_id = 1
  end
  Shift.populate 2 do |shift|
    shift.start_time = from_date + Rational(10, 24)
    shift.duration = 300
    shift.employee_id = 1..35
    shift.store_id = 1
  end
  Shift.populate 1 do |shift|
    shift.start_time = from_date
    shift.duration = 300
    shift.employee_id = 36..40
    shift.store_id = 1
  end
  from_date += 1
end
