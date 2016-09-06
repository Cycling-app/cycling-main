task :update_bike_info => :production do
  Updater.new
end

task :send_reminders => :environment do
  Client.send_reminders
end
