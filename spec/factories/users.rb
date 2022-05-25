FactoryBot.define do
    factory :user do
        name {Faker::Name.name}
        contact {Faker::Number.number(digits:10)}
        email {Faker::Internet.email}
        password {"123456"}
        password_confirmation {"123456"}
    end
end