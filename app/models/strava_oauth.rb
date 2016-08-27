class StravaOauth
  include HTTParty
  base_uri "https://www.strava.com/api"

  def initialize(code)
    @code = code
  end

  def get_strava_token
    "FIX ME"
  end
end
