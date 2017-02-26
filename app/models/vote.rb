class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true # important else it'll error out
  belongs_to :comment, optional: true # important else it'll error out
  belongs_to :voteable, polymorphic: true
end
