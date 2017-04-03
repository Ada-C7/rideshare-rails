class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end

  def new
    @rider = Rider.new
  end

  def create
    Rider.create(rider_params)

    redirect_to riders_path
  end

  private

  def rider_params
    return params.require(:rider).permit(:name)
  end

end
