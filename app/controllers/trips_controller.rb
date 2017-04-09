class TripsController < ApplicationController

  def index
    @trips = Trip.all
    @drivers = Driver.all
    @passengers = Passenger.all
  end

  def show
    @trip = Trip.find(params[:id])
    @drivers = Driver.all
    @passengers = Passenger.all
  end

  def new
    @trip = Trip.new
    @drivers = Driver.all
    @passengers = Passenger.all
  end

  def create
    @drivers = Driver.all
    @passengers = Passenger.all
    @trip = Trip.create(trip_params)

     if @trip.id != nil
          redirect_to trips_path
     else
          render "new"
     end
  end

  def edit
    @trip = Trip.find(params[:id])
    @drivers = Driver.all
    @passengers = Passenger.all
  end

def update
   @trip = Trip.find(params[:id])
   @drivers = Driver.all
   @passengers = Passenger.all
   @trip.date = trip_params[:date]
   @trip.cost = trip_params[:cost]
   @trip.rating = trip_params[:rating]

   @trip.driver_id = Driver.find(trip_params[:driver_id]).id
   @trip.passenger_id = Passenger.find(trip_params[:passenger_id]).id

   puts @trip.attributes
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
