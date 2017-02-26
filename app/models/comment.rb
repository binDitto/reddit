class Comment < ApplicationRecord
  belongs_to :user
  has_many :votes, as: :voteable, dependent: :destroy
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy


  def score
    votes.sum(:amount)
  end
end
