class Comment < ApplicationRecord
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy


  def score
    votes.sum(:amount)
  end
end
