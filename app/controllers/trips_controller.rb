class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new(rider_id: params[:rider_id])
  end

  def create
    trip = Trip.new
    trip.rider_id = params[:rider_id]
    trip.driver_id = rand(1..100)

    if trip.save
      redirect_to root_path
    else
      puts trip.errors.messages
    end
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

  def destroy
    Trip.destroy(params[:id])

    redirect_to trips_path
  end

  # private
  # def trip_params
  #   params.require(:trip).permit(:driver_id, :rider_id, :cost, :rating)
  # end
end
