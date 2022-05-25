FactoryBot.define do
  
    factory :passenger do
        name {Faker::Name.name}
        age {Faker::Number.within(range: 10..100)}
        email {Faker::Internet.email}
        contact {Faker::Number.number(digits:10)}
        users_id {FactoryBot.create(:user).id}
    end
  end