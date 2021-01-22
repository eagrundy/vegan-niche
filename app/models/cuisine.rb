class Cuisine < ApplicationRecord
    has_many :restaurants
    validates :name, uniqueness: true, presence: true
end