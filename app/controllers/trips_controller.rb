class TripsController < ApplicationController
  def index
    rider = Rider.find(params[:rider_id])
    @trips = rider.trips
  end

  def new
    rider = Rider.find(params[:rider_id])
    @trip = rider.trips.build
  end

  def create
    rider = Rider.find(params[:rider_id])
    default_params = {id: rand(601...10000),date: Time.now, rating: nil, rider_id: rider.id, driver_id: rand(1..100)}
    @trip = rider.trips.create(default_params)

    @trip.update_attributes(trip_params)
    @trip.save
    redirect_to rider_path(@trip.rider_id)
  end

  def show
    rider = Rider.find(params[:rider_id])
    @trip = rider.trips.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(rider_trip_params)
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
    return params.require(:trip).permit(:cost, :rating)
  end

  def rider_trip_params
  params.require(:rider_trip).permit(:rating)
end
end
