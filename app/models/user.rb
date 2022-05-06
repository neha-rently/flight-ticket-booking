class User < ApplicationRecord
    validates :username, presence: true
    validates :email, presence: true
    validates :contact, presence: true, length: { minimum: 10 }
end
