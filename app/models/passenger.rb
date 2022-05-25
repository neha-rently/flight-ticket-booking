class Passenger < ApplicationRecord
 
    validates :name, presence: true
    validates :age, presence: true
    validates :email, presence: true
    validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
    validates :contact, presence: true, length: { minimum: 10 }
    has_many  :tickets, dependent: :destroy
    has_many :flights, through: :tickets 
    belongs_to :user, foreign_key: :users_id

    
end
