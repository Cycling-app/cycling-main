require 'test_helper'

class BikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "when parts are expired it will send an email to the client" do
    client = Client.create!(first_name: "THINGS", token: ENV["STRAVA_API_TOKEN"], email: "that@this.com")
    bike = client.bikes.create
    part = bike.parts.create(distance_in_km: 1000, expected_lifetime_in_km: 1)

    bike.send_part_notification

    assert_equal ActionMailer::Base.deliveries.first.to, ["that@this.com"]
  end
end
