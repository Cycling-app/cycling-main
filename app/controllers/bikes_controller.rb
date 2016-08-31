class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :update, :destroy]

  def index
    @bikes = Bike.all

    render json: @bikes
  end

  def show
  end

  def create
    @bike = Bike.new(bike_params)

    if @bike.save
      render :show, status: :created, location: @bike
    else
      render json_errors(@bike)
    end
  end

  def update
    if @bike.update(bike_params)
      render :show, status: :ok, location: @bike
    else
      render json_errors(@bike)
    end

  end

  def destroy
    @bike.destroy

    head :no_content
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end


  def bike_params
    params.require(:bike).permit(:name, :serial_number, :model, :brand, :client_id, :bought_on)
  end
end
