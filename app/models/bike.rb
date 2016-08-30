class Bike < ApplicationRecord
  validates :client_id, presence: true 
  belongs_to :client
  has_many :parts
end
