class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.new
    @trip.date = Date.current
    @trip.rating = 0
    @trip.cost = rand(5.0..30.0).round(2)
    @trip.driver_id = Driver.assign_driver
    # @trip.driver = Driver.all.sample
    @trip.passenger_id = params[:passenger_id]
    if @trip.save
      redirect_to passenger_path(params[:passenger_id])
    else
      puts "didn't create new trip"
      redirect_to passenger_path(params[:passenger_id])
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if @trip.save
      redirect_to trip_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    Trip.destroy(params[:id])
    redirect_to :root
  end

  private

  def trip_params
    params.require(:trip).permit(:rating, :cost)
  end
end
