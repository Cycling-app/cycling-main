class Bike < ApplicationRecord
  belongs_to :clients
  has_many :parts
end
