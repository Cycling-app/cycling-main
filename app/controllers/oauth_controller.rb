class OauthController < ApplicationController
  # POST /oauth/strava
  def create
    # Takes in code posted and starts building client with that clients info
    @oauth = StravaOauth.new(params[:code])

    client_info = @oauth.get_strava_token

    # If the code is Invalid then it renders an error to let the front end know
    if client_info["errors"]
      render invalid_token_error(client_info)
    else
    # If the code is Valid then it proceeds to find the client by their email
      @client = Client.find_by(email: client_info["athlete"]["email"])

    # If the client does not exist then it will proceed to make a new client
      unless @client
        @client = Client.new(
        email: client_info["athlete"]["email"]
        )
      end

    # If the client changes their info on strava it will update our stored information?
      @client.assign_attributes(
      token: client_info["access_token"],
      first_name: client_info["athlete"]["firstname"],
      last_name: client_info["athlete"]["lastname"],
      email: client_info["athlete"]["email"]
      )
    # Should the client be saved to our database then it will return the json body of client information
      if @client.save
        client_info["client"] = @client
        render json: client_info
      else
    # If it cannot save it will provide an error message for the client information
        render json_errors(@client)
      end
    end
  end

  def invalid_token_error(response)
    {
      json:
      {
        errors: {
          fields: {code: ["is invalid"]},
          full_messages: "Code is invalid",
          provider_errors: response
        }

      },
      status: :unprocessable_entity
    }
  end
end
