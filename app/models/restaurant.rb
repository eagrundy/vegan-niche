class Restaurant < ApplicationRecord
    belongs_to :cuisine
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    accepts_nested_attributes_for :reviews
    validates :name, :cuisine, :image_url, :options, presence: true
    validates :name, uniqueness: true

    scope :search_by_name, -> (search) { where("name || options LIKE ?", "%#{search}%")}


end