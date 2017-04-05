class TripsController < ApplicationController


  def new
     @trip = Trip.new
  end

  def create
    Trip.create(trip_params)
    # where to redirect? passenger page?
    # redirect_to trips_path
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
