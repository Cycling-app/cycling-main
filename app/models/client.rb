class Client < ApplicationRecord
  validates :email, presence:, uniqueness: true
  has_many :bikes
  has_many :parts, through :bikes
end
