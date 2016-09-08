class PartsController < ApplicationController
  before_action :set_part, only: [:show, :update, :destroy]

  def index
    @parts = Part.all

    render json: @parts
  end

  def show
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      render :show, status: :created, location: @part
    else
      render json_errors(@part)
    end
  end

  def update
    if @part.update(part_params)
      render :show, status: :ok, location: @part
    else
      render json_errors(@part)
    end
  end

  def destroy
    @part.destroy

    head :no_content
  end

  private

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(
      :part_type,
      :description,
      :serial_number,
      :bike_id,
      :mounted_on,
      :purchased_on
    )
  end
end
