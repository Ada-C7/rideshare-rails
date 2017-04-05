class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @result_trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.create trip_params

    if @trip.id != nil
      redirect_to trips_path
    else
      render "new"
    end
  end

  def new
    @trip = Trip.new
  end

  private

  def trip_params
    params.require(:trip).permit(:id, :driver_id, :passenger_id, :date, :rating)
  end

end
