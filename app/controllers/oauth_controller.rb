class OauthController < ApplicationController
  # POST /oauth/strava
  def create
    @oauth = StravaOauth.new(params[:code])

    render json: { token: @oauth.get_strava_token }
  end
end
