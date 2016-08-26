class OauthController < ApplicationController
  include HTTParty
  base_uri "https://www.strava.com/api/token"

  def initialize(code)
    @code = code
  end

  def get_strava_code
    self.class.get"/
  end
end
