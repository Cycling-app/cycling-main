api_token_path = File.expand_path("#{Rails.root}/.strava_api_token")

if File.exists?(api_token_path)
  ENV['STRAVA_API_TOKEN'] = File.read(api_token_path).strip
end
