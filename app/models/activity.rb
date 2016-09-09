class Activity < ActiveRecord::Base
  belongs_to :bike
  validates :strava_id, uniqueness: true
end
