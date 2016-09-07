require 'test_helper'

class StravaClientTest < ActionDispatch::IntegrationTest

  test "can hit strava api" do
    VCR.use_cassette("strava-api", :record => :new_episodes) do
      bike = Bike.new
      client = Client.create!(token: "aa408b1d672cbbd0afe9993fcb5fb0a470b4672a", email: "this@that.com")
      strava = StravaClient.new(client, bike)
      payload = strava.update_mileage
    end
  end

  test "can update mileage on parts" do
    VCR.use_cassette("strava-api", :record => :new_episodes) do
      client = Client.create!(first_name: "THINGS", token: "aa408b1d672cbbd0afe9993fcb5fb0a470b4672a", email: "that@this.com")
      # bike = Bike.create!(client_id: client.id)
      # part = Part.create!(bike_id: bike.id)
      ## The hashed out sections are the older way of handling this
      bike = client.bikes.create
      part = bike.parts.create

      strava = StravaClient.new(client, bike) # or => StravaClient.new(client, client.bikes.last)

      strava.update_mileage

      # part.reload
      # must do the above in order to achieve the part desired
      assert_equal part.distance_in_km, 3.9762
    end
  end
end
