class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trips = Trip.new
  end

  def create
    Trip.create(trip_params)

    redirect_to trips_path
  end

  def show
    @trips = Trip.find(params[:id])
  end

private
  def trip_params
    return params.require(:trip).permit(:trip_id, :driver_id, :passenger_id, :date, :rating)
  end

end
