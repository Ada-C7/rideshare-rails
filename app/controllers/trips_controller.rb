class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @rider_id = params[:id]
    @trip.rider = Rider.find(@rider_id)
  end

  def create
    @trip = Trip.new
    @trip.date = Time.now
    @trip.rating  = nil
    # @trip.rider_id = @trip.rider.id
    # @trip.driver_id = rand(1..100)
    @trip.save
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private
  def trip_params
    return params.require(:trip).permit(:date, :rating)
  end
end
