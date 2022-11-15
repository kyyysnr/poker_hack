class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by
    likes.exist?(ip: request.remote_ip)
  end
end
