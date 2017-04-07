class TripsController < ApplicationController


  def new
     @trip = Trip.new
  end

  def create
    #message if driver = nil and no driver available
    Trip.create(driver: Trip.find_driver, passenger_id: params[:passenger_id],
      date: Date.today, cost: rand(1..5000))
    redirect_to passenger_path(params[:passenger_id])
  end


  def show
    @trip = Trip.find(params[:id])
  end


  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.update(trip_params)
    redirect_to trip_path(trip)
  end

  def destroy
    Trip.find(params[:id]).destroy
    # where to redirect? passenger page?
    # redirect_to trips_path
  end

  private
  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :rating, :date)
  end
end
