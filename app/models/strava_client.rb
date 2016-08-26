class StravaClient
  def initialize
    @api_client = Strava::Api::V3::Client.new(:access_token => "aa408b1d672cbbd0afe9993fcb5fb0a470b4672a")
  end

  def update_mileage
    activity = @api_client.list_athlete_activities[0]["distance"]
    # Are these new activties? Have I seen them before. (I need a way to remember the ids that I see)
    end
end
