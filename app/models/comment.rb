class Comment < ApplicationRecord
  belongs_to :post
  has_many :comment_likes,dependent: :destroy
  has_many :comment_dislikes,dependent: :destroy

  validates :body, presence:true

end
