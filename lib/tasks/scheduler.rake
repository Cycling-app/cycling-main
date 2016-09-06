task :update_bike_info => :environment do
  Updater.new
end

task :send_reminders => :environment do
  Client.send_reminders
end
