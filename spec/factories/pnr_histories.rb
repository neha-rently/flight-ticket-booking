FactoryBot.define do
  factory :pnr_history do
    pnr_id { create(:pnr).id }
    ticket_id { create(:ticket).id }
  end
end
