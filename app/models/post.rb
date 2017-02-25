class Post < ApplicationRecord
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
end
