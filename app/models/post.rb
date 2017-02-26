class Post < ApplicationRecord
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy
  validates :title, presence: true, uniqueness: true, length: {minimum: 5}
  validates :body, presence: true, uniqueness: true, length: {minimum: 10}
  # setting default url for img_url
  # def img_url(url= "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7G9JTqB8z1AVU-Lq7xLy1fQ3RMO-Tt6PRplyhaw75XCAnYvAYxg")
  #   self[:img_url] || url
  # end

  # add all vote amount to get sum of votes for post
  def score
    votes.sum(:amount)
  end

end
