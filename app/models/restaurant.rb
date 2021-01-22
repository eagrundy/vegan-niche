class Restaurant < ApplicationRecord
    belongs_to :cuisine
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, :cuisine, presence: true
    validates :name, uniqueness: {scope: :cuisine, message: 'with that cuisine already exists!'}
end