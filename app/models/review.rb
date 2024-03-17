class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  validates :clientele, presence: true
  validates :management, presence: true
  validates :role, presence: true


  validates_length_of :title, :maximum => 30, :too_long => " Your title is too long"

  acts_as_votable
end
