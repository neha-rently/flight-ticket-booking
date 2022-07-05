FactoryBot.define do
  
    factory :flight do
        flight_no {Faker::Alphanumeric.alpha(number:5)}
        journey_date {Faker::Date.forward(days: 14)}
        arr_time {Faker::Time.forward(days: 1).strftime("%k:%M")}
        dep_time {Faker::Time.forward(days: 0).strftime("%k:%M")}
        departing {Faker::Address.city}
        arriving {Faker::Address.city}
        flight_status {Faker::Name.name}
        seats_available {Faker::Number.between(from: 1, to: 200)}
        economy {Faker::Number.decimal}
        business {Faker::Number.decimal}
    end
  end