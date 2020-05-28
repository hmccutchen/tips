class Restaurant < ApplicationRecord
  validates :name, uniqueness: { scope: :address }
  has_many :reviews, dependent: :destroy

end
