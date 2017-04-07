class TripsController < ApplicationController
  def index
    @trips = Trip.all
    raise
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])

    trip.driver_id = params[:trip][:driver_id]
    trip.rider_id = params[:trip][:rider_id]
    trip.cost = params[:trip][:cost]
    trip.rating = params[:trip][:rating]

    if trip.save
      redirect_to trip_path(trip.id)
    end
  end
end
