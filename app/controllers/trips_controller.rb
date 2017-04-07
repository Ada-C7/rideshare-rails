class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @trip.passenger_id = params[:passenger_id]
    @trip.driver_id = Driver.first_available.id
  end

  def create
    trip_data = trip_params
    @trip = Trip.create(trip_data)
    if @trip.save
      redirect_to passenger_path(@trip.passenger_id)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

    def update
      trip = Trip.find(params[:id])
      trip.update_attributes(trip_params)
      trip.save
      redirect_to trip_path(trip)
    end

    def destroy
      trip = Trip.find(params[:id])
      trip.destroy
      redirect_to trips_path
    end

    private
    def trip_params
      return params.require(:trip).permit(:id, :driver_id, :passenger_id, :date, :rating, :price)
    end

  end
