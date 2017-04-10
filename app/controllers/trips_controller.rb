class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
      Rider.find(params[:rider_id]).trips.each do |trip|
          if trip.rating != nil
              @trip = Trip.new(rider_id: params[:rider_id])
          else
              raise 'error'
          end
      end
  end

  def create
    trip = Trip.new
    trip.rider_id = params[:rider_id]
    trip.driver_id = rand(1..Driver.last.id)

    if trip.save
      redirect_to rider_path(trip.rider_id)
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
