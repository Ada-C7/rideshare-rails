class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy

    redirect_to trips_path
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.update_attributes(trip_params)
    trip.save

    redirect_to trips_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:name, :phone_num)
  end

end
