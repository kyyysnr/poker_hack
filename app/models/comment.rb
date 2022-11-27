class Comment < ApplicationRecord
  belongs_to :post
  has_many :comment_likes,dependent: :destroy
  has_many :comment_dislikes,dependent: :destroy
  has_many_attached :images

  validates :body, presence:true

end
