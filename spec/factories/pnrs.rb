FactoryBot.define do
  factory :pnr do
    booking_date { "2022-05-26" }
    user_id { create(:user).id }
    count {2}
  end
end
