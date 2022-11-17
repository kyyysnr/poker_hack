class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :images

  validates :body, presence:true

end
