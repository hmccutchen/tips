class Restaurant < ApplicationRecord
  validates :name, :uniqueness => {scope: :address}
  has_many :reviews
  # has_one_attached :picture
end
