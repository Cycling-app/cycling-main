class Part < ApplicationRecord
  validates :bike_id, presence: true
  belongs_to :bike

  def expired?
    distance_in_km >= expected_lifetime_in_km
  end
 # Checks part for mileage on it against its expected lifetime
end
