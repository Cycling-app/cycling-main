class StravaClient
  attr_reader :api_client

  def initialize(client, bike)
    @bike = bike
    @client = client
    @api_client = Strava::Api::V3::Client.new(:access_token => @client.token)
  end

  def update_mileage
    per_page = 100
    current_page = 1
    loop do
      data = @api_client.list_athlete_activities(
                            per_page: per_page,
                            page: current_page
                          )

      save_activities(data)

      if data.size == per_page
        current_page += 1
      else
        break
      end
    end

    apply_mileage
  end

  def save_activities(activities_data)
    activities_data.each do |a|
      Activity.create(
        mileage: a["distance"],
        strava_id: a["id"],
        activity: a["type"],
        client_id: @client.id,
        bike_id: @bike.id
      )
    end
  end

   def apply_mileage
     @bike.parts.each do |part|
       part.distance_in_km = @bike.activities.where(activity: "Ride").sum(:mileage) / 1000
       part.save
     end
   end
end
