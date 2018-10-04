class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :reviews
 acts_as_voter
end
