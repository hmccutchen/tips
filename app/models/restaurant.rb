class Restaurant < ApplicationRecord
  validates_uniqueness_of :name, { scope: :address }
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
end
