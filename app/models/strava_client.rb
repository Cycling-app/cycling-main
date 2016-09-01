class StravaClient
  attr_reader :api_client

  def initialize(token, bike)
    @bike = bike
    @token = token
    @api_client = Strava::Api::V3::Client.new(:access_token => @token)
  end

  def update_mileage
    @api_client.list_athlete_activities[0]["distance"]
    # Are these new activties? Have I seen them before. (I need a way to remember the ids that I see)
  end
end
