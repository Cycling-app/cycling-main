class StravaOauth
  #     -X POST https://www.strava.com/oauth/token \
  #     -F client_id=5 \
  #     -F client_secret=7b2946535949ae70f015d696d8ac602830ece412 \
  #     -F code=75e251e3ff8fff
  ### This is sample data this secret and code wont work!!!!
  
  def initialize(code)
    @code = code
  end


  def get_strava_token
    options = {
      body: {
        client_id: ENV["STRAVA_CLIENT_ID"],
        client_secret: ENV["STRAVA_CLIENT_SECRET"],
        code: @code
      }
    }
    HTTParty.post("https://www.strava.com/oauth/token", options)
  end
end
