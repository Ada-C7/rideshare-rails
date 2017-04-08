class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    Trip.create(trip_params)

    redirect_to trips_path
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.update_attributes(trip_params)
    trip.save

    redirect_to trip_path(trip)
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy

    redirect_to trips_path
  end

  private
    def trip_params
      return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost_in_cents)
    end
end
