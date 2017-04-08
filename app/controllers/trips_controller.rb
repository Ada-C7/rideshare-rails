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

    @trip.driver_id = trip_params[:driver_id]
    @trip.passenger_id = trip_params[:passenger_id]
    @trip.date = trip_params[:date]
    @trip.rating = trip_params[:rating]

    if @trip.save
      redirect_to trip_path(@trip.id)
    end
  end

  # def new
  #   @trip = Trip.new
  # end
  #
  # def create
  #   @trip = Trip.create trip_params
  #
  #   redirect_to trips_path
  # end

  def new
    @trip = Trip.new(passenger_id: params[:passenger_id])
  end

  def create
    trip = Trip.new
    trip.passenger_id = params[:passenger_id]
    trip.driver_id = rand(1..(Driver.all.length))
    trip.date = Time.now

    if trip.save
      redirect_to passenger_path(params[:passenger_id])
    else
      puts trip.errors.messages
    end
  end

  def destroy
    Trip.destroy(params[:id])

    redirect_to trips_path
  end


  private

  def trip_params
    params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating)
  end
  # def find_passenger_trips
  #
  # end
end
