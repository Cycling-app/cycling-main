class SessionsController < ApplicationController

  # This should only be needed if you are going to make a manual log in for the site
  ## The primary functionality of the site is to log in with Strava so this is un needed as of now
  def new
    @client = Client.new
  end
  # Makes a new client

  def create
    @client = Client.find_by(email: params["client"]["email"])
  # Finds the newly made client by their email
    if @client && @client.authenticate(params["client"]["password"])
      session[:client_id] = @client.id
      redirect_to root_path, notice: "You Have successfully logged in!"
  # Checks to make sure that they are authenticated using bcrypt,
  ## make sure bcrypt gem is turned on in the gem file, and has_secure_password is present on client model
  ### If they are authorized they will be logged in and have a friendly notice
    else
      redirect_to new_session_path, notice: "Something was wrong, Try again!"
    end
  end

  def destroy
    session[:client_id] = nil

    redirect_to root_path, notice: "You have successfully logged out"
  end
end
