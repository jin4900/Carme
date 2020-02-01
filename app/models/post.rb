class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  def like_user(id)
    likes.find_by(user_id: id)
  end
  validates :image, presence: true
  validates :text, presence: true
end
