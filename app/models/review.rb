class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    validates :content, length: { maximum: 250 }, presence: true
  

end