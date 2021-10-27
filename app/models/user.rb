class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  has_many :followed_relationships, class_name: "Relationship",foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :followed_relationships, source: :follower
  
  has_many :follower_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :follower_relationships, source: :followed
  attachment :profile_image

  validates :name, uniqueness: true, length: { in:2..20 }
  validates :introduction, length: { maximum: 50 }
  
  
  def follow(user_id)
    followed_relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    followed_relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
   followings.include?(user)
  end

end