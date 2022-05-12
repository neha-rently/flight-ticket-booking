class Ticket < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight, foreign_key: :flights_id
  belongs_to :user, foreign_key: :users_id
end
