class SessionsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.find_by(email: params["client"]["email"])

    if @client && @client.authenticate(params["client"]["password"])
      session[:client_id] = @client.id
      redirect_to root_path, notice: "You Have successfully logged in!"
    else
      redirect_to new_session_path, notice: "Something was wrong, Try again!"
    end
  end

  def destroy
    session[:client_id] = nil

    redirect_to root_path, notice: "You have successfully logged out"
  end
end
