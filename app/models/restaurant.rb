class Restaurant < ApplicationRecord
  validates_uniqueness_of :name, { scope: :address }
  has_many :reviews, dependent: :destroy
end
