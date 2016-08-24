class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new
    if @client = Client.create(client_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private def client_params
    params.require("client").permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
