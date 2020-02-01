class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  def posts
    return Post.where(user_id: self.id)
  end
  validates :nickname, presence: true, format: {with: /\A[a-zA-Z0-9]+\z/}
  validates :email, presence: true, format: {with: /\A\S+@\S+\.\S+\z/}
  validates :password, presence: true, format: {with: /\A[a-zA-Z0-9]+\z/}
end
