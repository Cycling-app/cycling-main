class Updater
  def initialize
    Client.all.each do |client|
      client.bikes.each do |bike|
          StravaClient.new(client, bike).update_mileage

      end
    end
  end
end
