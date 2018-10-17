class Topic < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  has_many :microposts
  belongs_to :user
end