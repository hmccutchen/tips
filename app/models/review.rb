class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :user_reviews

  acts_as_votable
end
