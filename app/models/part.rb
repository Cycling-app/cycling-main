class Part < ApplicationRecord
  validates :bike_id, presence: true
  belongs_to :bike
end
