class Cuisine < ApplicationRecord
    has_many :restaurants
    validates :name, uniqueness: true, presence: true
    accepts_nested_attributes_for :restaurants
end