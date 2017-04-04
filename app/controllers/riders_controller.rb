class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end

  def show
    @rider = Rider.find(params[:id])
  end

  def new
    @rider = Rider.new
  end

  def create
    rider = Rider.create rider_params

    unless rider.id == nil
      redirect_to riders_path
    end
  end

  def edit
    @rider = Rider.find(params[:id])
  end

  private

  def rider_params
    params.require(:rider).permit(:name, :phone_num)
  end
end
