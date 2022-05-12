class Passenger < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :email, presence: true
    validates :contact, presence: true, length: { minimum: 10 }
    has_many  :tickets, dependent: :destroy
    has_many :flights, through: :tickets 
    belongs_to :user, foreign_key: :users_id
end
