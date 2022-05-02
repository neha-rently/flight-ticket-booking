class Passenger < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :email, presence: true
    validates :contact, presence: true, length: { minimum: 10 }
end
