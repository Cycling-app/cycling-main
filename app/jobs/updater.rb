class Updater
  def initialize
    Client.all.each do |client|
      client.bikes.each do |bike|
        StravaClient.new(client, bike)
      end
    end
  end
end
