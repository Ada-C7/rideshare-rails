class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.create(rider_params)

    if @rider.save
      redirect_to riders_path
    else
      render :new
    end
  end

  # def trip_list
  #   @rider = Rider.find(params[:id])
  #   @trips = Trip.find(@rider.id)
  # end

  def show
    @rider = Rider.find(params[:id])
  end

  def edit
    @rider = Rider.find(params[:id])
  end

  def update
    @rider = Rider.find(params[:id])
    @rider.update_attributes(rider_params)

    if @rider.save
      redirect_to riders_path(@rider)
    else
      render :edit
    end
  end

  def destroy
    rider = Rider.find(params[:id])
    rider.destroy

    redirect_to riders_path
  end

  private

  def rider_params
    return params.require(:rider).permit(:name)
  end

end
