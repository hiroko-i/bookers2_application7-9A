class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.looks(seachwords,hows)
    if hows == "match"
      @book = Book.where("title LIKE ?","#{seachwords}")
    elsif hows == "forward_match"
      @book = Book.where("title LIKE ?","#{seachwords}%")
    elsif hows == "backward_match"
      @book = Book.where("title LIKE ?","%#{seachwords}")
    else
      @book = Book.where("title LIKE ?","%#{seachwords}%")
    end
  end
  
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
