class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end

  def create
    @rider = Rider.new(rider_params)

    if @rider.save
      redirect_to rider_path(@rider.id)
    else
      render :new
    end
  end

  def new
    @rider = Rider.new
  end

  def edit
    @rider = Rider.find(params[:id])
  end

  def show
    @rider = Rider.find(params[:id])
  end

  def update
    rider = Rider.find(params[:id])

    if rider.update(rider_params)
      redirect_to rider_path
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
