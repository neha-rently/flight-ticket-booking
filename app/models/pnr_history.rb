class PnrHistory < ApplicationRecord
  belongs_to :pnr, foreign_key: :pnr_id
  belongs_to :ticket, foreign_key: :ticket_id
end
