class Pnr < ApplicationRecord
  belongs_to :user
  has_many :pnr_histories, foreign_key: :pnr_id
  has_many :tickets, through: :pnr_histories
  
end
