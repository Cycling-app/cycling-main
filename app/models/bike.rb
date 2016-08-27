class Bike < ApplicationRecord
  belongs_to :client
  has_many :parts
end
