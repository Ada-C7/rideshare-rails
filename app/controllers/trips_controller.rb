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
      redirect_to passenger_path(@trip.passenger_id)
    else
      render "edit"
    end
  end

  def rating
    redirect_to edit_trip_path
  end

  def create
    # call incomplete_rating method inside the Passenger model to ensure that all conditions for creating a new trip has been met
    passenger = Passenger.find(params[:passenger_id])
    if !passenger.has_incomplete_rating?
      @trip = Trip.new
      @trip.passenger_id = params[:passenger_id]
      @trip.rating = 0
      @trip.cost = rand(100..10000)

      # call available_driver method inside Driver model
      driver = Driver.available_driver
      @trip.driver_id = driver.id

      # saves the new trip instance
      @trip.save
      redirect_to passenger_path(params[:passenger_id])
    else
     #fails: there was a unrated trip for that passenger
     redirect_to passenger_path(params[:passenger_id]), warning: "Trip Canceled: you have one or more unrated trips. You must rate all your trips before starting a new trip!"

    end
    # returns to the passenger details page where the new trip request originated from

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
