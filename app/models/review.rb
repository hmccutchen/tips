class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_rich_text :content

  acts_as_votable
end
