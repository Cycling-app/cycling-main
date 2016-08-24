class Client < ApplicationRecord
  has_secure_password
  validates :email, format: {with: /@/}, uniqueness: true
  has_many :bikes
  has_many :parts, through :bikes
end
