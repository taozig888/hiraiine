class Shop < ApplicationRecord
  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  
  belongs_to :user
end
