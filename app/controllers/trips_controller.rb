class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    trip = Trip.create(trip_params)
    redirect_to trips_path unless trip.id == nil
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    if trip.update(trip_params)
      redirect_to trip_path
    end
  end

  def trip_params
    params.require(:trip).permit(:date, :cost, :rating, :driver_id, :passenger_id)
  end
end
