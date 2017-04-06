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
    @trip = Trip.find(params[:id])

    if @trip.update(trip_params)
      redirect_to trip_path
    else
      render "edit"
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create trip_params
    if @trip.id != nil
      redirect_to trips_path
    else
      render "new"
    end
  end

  def destroy
    Trip.destroy(params[:id])
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:cost, :rating, :driver_id, :passenger_id)
  end
end
