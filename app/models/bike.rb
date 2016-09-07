class Bike < ApplicationRecord
  validates :client_id, presence: true
  belongs_to :client
  has_many :parts
  has_many :activities

  def expired_parts
    parts.select{ |part| part.expired? }
  end

  def send_part_notification
    
    unless expired_parts.empty?
      BikeMailer.parts_expired(self).deliver_now
    else
      #do nothing
    end



    # bike.parts.each do |part|
    #   part.distance_in_km.expired?
    # end

  end
end
