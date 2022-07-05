FactoryBot.define do
  
    factory :ticket do
        checkin_status {Faker::Name.name}
        luggage {"5 Kgs"}
        food {"Veg"}
        passenger_id {create(:passenger).id}
        flights_id {create(:flight).id}
        # contact {Faker::Number.number(digits:10)}
        users_id {create(:user).id}
        cost {Faker::Number.decimal}
        seat_class {"Economy"}
    end
  end