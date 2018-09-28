class Review < ApplicationRecord
  belongs_to :restaurant
  has_and_belongs_to_many :users
  acts_as_votable
end
