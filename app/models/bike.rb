class Bike < ApplicationRecord
  validates :client_id, presence: true
  belongs_to :client
  has_many :parts
  has_many :activities

  def expired_parts
    parts.select{ |part| part.expired? }
  end
end
