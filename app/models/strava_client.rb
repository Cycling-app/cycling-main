class StravaClient
  attr_reader :api_client

  def initialize(client, bike)
    @bike = bike
    @client = client
    @api_client = Strava::Api::V3::Client.new(:access_token => @client.token)
  end

  def update_mileage
    @api_client.list_athlete_activities.each do |a|
      a["distance"]
      activity = Activity.create(
        mileage: a["distance"],
        strava_id: a["id"],
        activity: a["type"],
        client_id: @client.id,
        bike_id: @bike.id
      )
    end

    @bike.parts.each do |part|
      part.distance_in_km = @bike.activities.sum :mileage
      part.save
    end

    # I need to now add the activities to a client so that it puts them on the bike, and that bike's parts
    # Are these new activties? Have I seen them before. (I need a way to remember the ids that I see)
  end

  
end
