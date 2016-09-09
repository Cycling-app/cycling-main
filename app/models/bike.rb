class Bike < ApplicationRecord
  validates :client_id, presence: true
  belongs_to :client
  has_many :parts
  has_many :activities

  def expired_parts
    parts.select{ |part| part.expired? }
  end

  def expired_parts_that_need_notification
    expired_parts.select{ |part| part.email_sent? != true }
  end

  def send_part_notification

    unless expired_parts_that_need_notification.empty? #&& expired_parts

      BikeMailer.parts_expired(self).deliver_now

      expired_parts_that_need_notification.each do |part|
        part.email_sent = true
        part.save!
      end
      # (email_sent: true)
    end



    # bike.parts.each do |part|
    #   part.distance_in_km.expired?
    # end

  end
end
