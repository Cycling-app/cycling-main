class OauthController < ApplicationController
  # POST /oauth/strava
  def create
    @oauth = StravaOauth.new(params[:code])

    client_info = @oauth.get_strava_token

    @client = Client.create(
      tokens: client_info["access_token"],
      first_name: client_info["athlete"]["firstname"],
      last_name: client_info["athlete"]["lastname"],
      email: client_info["athlete"]["email"]
    )

    client_info["client"] = @client
    render json: client_info
  end
end
