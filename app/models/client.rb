class Client < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :bikes
  has_many :parts, through: :bikes
  has_many :activities
end
