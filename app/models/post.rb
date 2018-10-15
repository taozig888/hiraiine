class Post < ApplicationRecord
  validates :comment, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  
  belongs_to :topic #post.topic とすると、このpost インスタンスを持っているtopicを取得できる
end
