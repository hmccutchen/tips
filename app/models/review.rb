class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  acts_as_votable
end
