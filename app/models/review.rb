class Review < ApplicationRecord
  belongs_to :restaurant
  has_and_belongs_to :user
end
