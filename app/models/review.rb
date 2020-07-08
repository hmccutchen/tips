class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_rich_text :content

  validates_length_of :title, :maximum => 30, :too_long => " Your title is too long"

  acts_as_votable
end
