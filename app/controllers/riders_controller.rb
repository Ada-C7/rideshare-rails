class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end

  def show
    @rider = Rider.find(params[:id])
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
end
