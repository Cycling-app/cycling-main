class StravaClient
  attr_reader :api_client

  def initialize
    @api_client = Strava::Api::V3::Client.new(:access_token => ENV["STRAVA_API_TOKEN"])
  end

  def update_mileage
    activity = @api_client.list_friends_activities[0]["distance"]
    # Are these new activties? Have I seen them before. (I need a way to remember the ids that I see)
  end
end
