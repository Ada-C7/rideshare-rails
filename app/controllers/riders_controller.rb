class RidersController < ApplicationController
  def index
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.create rider_params

    unless @rider.id == nil
      redirect_to riders_path
    else
      render "new"
    end

  end

  def edit
    @rider = Rider.find params[:id]
  end

  def update
    @rider = Rider.find params[:id]

    @rider.name = rider_params[:name]
    @rider.phone = rider_params[:phone]

    if @rider.save
      redirect_to rider_path
    else
      render "edit"
    end

  end

  def destroy
    Rider.destroy(params[:id])
    redirect to riders_path

  end

  private
  def rider_params
    params.require(:rider).permit(:name, :phone)
  end
end
