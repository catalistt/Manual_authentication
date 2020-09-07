class User < ApplicationRecord
  has_many :stories
  validates :email, uniqueness: true
  has_secure_password
end
