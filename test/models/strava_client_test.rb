require 'test_helper'

class StravaClientTest < ActionDispatch::IntegrationTest

  test "can hit strava api" do
    VCR.use_cassette("strava-api") do
      bike = Bike.new
      client = Client.create(token: "aa408b1d672cbbd0afe9993fcb5fb0a470b4672a")
      strava = StravaClient.new(client.token, bike)
      payload = strava.update_mileage
      assert_equal payload, 3976.2
    end
  end

  test "can update mileage on parts" do
    VCR.use_cassette("strava-api") do
      client = Client.create(first_name: "THINGS", token: 'aa408b1d672cbbd0afe9993fcb5fb0a470b4672a')
      strava = StravaClient.new("aa408b1d672cbbd0afe9993fcb5fb0a470b4672a", bike)
      bike = Bike.new
      part = Part.new

      strava.update_mileage

      assert_equal part.distance_in_km, 3976.2
    end
  end

end
