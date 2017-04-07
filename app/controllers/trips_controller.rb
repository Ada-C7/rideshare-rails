class TripsController < ApplicationController
  def index
    @trips = Trip.all
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
      redirect_to trips_path
    end
  end
end
