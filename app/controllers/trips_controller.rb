class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create trip_params

    unless @trip.id == nil
      redirect_to trips_path
    else
      render "new"  #need to add validations to trip model
    end
  end



  private

  def trip_params
    params.require(:trip).permit(:driver_id, :rider_id, :date, :rating, :cost)

end
