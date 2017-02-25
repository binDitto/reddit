class Comment < ApplicationRecord
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
