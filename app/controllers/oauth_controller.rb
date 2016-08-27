class OauthController < ApplicationController
  include HTTParty
  base_uri "https://www.strava.com/api"

  def initialize(code)
    @code = code
  end

  def get_strava_code
  end
end
