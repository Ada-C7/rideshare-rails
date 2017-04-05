class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @result_trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.driver_id = trip_params[:driver_id]
    trip.rider_id = trip_params[:rider_id]
    trip.date = trip_params[:date]
    trip.rating = trip_params[:rating]

    if trip.save
      redirect_to trip_path(trip.id)
    end

  end


  private

  def trip_params
    params.require(:trip).permit(:driver_id, :rider_id, :date, :rating)
  end


end
