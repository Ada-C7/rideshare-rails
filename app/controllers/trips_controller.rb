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
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
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
    redirect_to trip_path
  end

  private
  def trip_params
    return params.require(:trip).permit(:date, :rating, :driver, :passenger)
  end

end
