class Restaurant < ApplicationRecord
    belongs_to :cuisine
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    validates :name, :cuisine, presence: true
    validates :name, uniqueness: {scope: :cuisine, message: 'with that cuisine already exists!'}

    scope :search_by_name, -> (search) { where("name || options LIKE ?", "%#{search}%")}

    def cuisine_attributes=(attr)
        # find or create a cuisine by name
        if attr["name"].present?
            self.cuisine = Cuisine.find_or_create_by(attr)
        end
        # associate it with the restaurant
        
    end
end