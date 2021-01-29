class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :restaurants, through: :reviews

    validates :password, presence: true, length: {within: 5...32}
    
    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    
    has_secure_password

end