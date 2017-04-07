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
     @trip = Trip.find(params[:id])

     @trip.date = trip_params[:date]
     @trip.cost = trip_params[:cost]
     @trip.rating = trip_params[:rating]
     @trip.driver_id = Driver.find(trip_params[:driver_id])
     @trip.passenger_id = Passenger.find(trip_params[:passenger_id])

     if @trip.save
          redirect_to trip_path
     else
          render "edit"
     end
end

  def destroy
    Trip.destroy(params[:id])
    redirect_to trips_path
  end

  def trip_params
    params.require(:trip).permit(:date, :cost, :rating, :driver_id, :passenger_id)
  end
end
