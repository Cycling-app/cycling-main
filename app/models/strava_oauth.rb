class StravaOauth
  include HTTParty
  base_uri "https://www.strava.com/"
  #     -X POST https://www.strava.com/oauth/token \
  #     -F client_id=5 \
  #     -F client_secret=7b2946535949ae70f015d696d8ac602830ece412 \
  #     -F code=75e251e3ff8fff
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
    self.class.post("/oauth/strava", options)
  end
end
