class OauthController < ApplicationController
  # POST /oauth/strava
  def create
    @oauth = StravaOauth.new(params[:code])

    client_info = @oauth.get_strava_token

    @client = Client.find_by(email: params["email"])

    if @client

    else
      @client = Client.new(
        email: client_info["athlete"]["email"]
      )
    end

    @client.update(
      tokens: client_info["access_token"],
      first_name: client_info["athlete"]["firstname"],
      last_name: client_info["athlete"]["lastname"],
      email: client_info["athlete"]["email"]
    )
    if @client.save
      client_info["client"] = @client
      render json: client_info
    else
      render json_errors(@client)
    end
  end
end
