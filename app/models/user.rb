class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    validates :email, :username, presence: true
    validates :email, uniqueness: true




end