class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    validates :content, length: { maximum: 250 }
    validates :rating, presence: true

end