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

  def update
    rider = Rider.find(params[:id])

    rider.name = params[:rider][:name]
    rider.phone_num = params[:rider][:phone_num]

    if rider.save
      redirect_to rider_path(rider.id)
    end
  end

  def destroy
    Rider.destroy(params[:id])

    redirect_to riders_path
  end

  private
  def rider_params
    params.require(:rider).permit(:name, :phone_num)

  end
end
