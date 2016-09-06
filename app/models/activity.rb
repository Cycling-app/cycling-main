class Activity < ActiveRecord::Base
  belongs_to :client
  belongs_to :bike
end
