class TripsController < ApplicationController
  def index
    rider = Rider.find(params[:rider_id])
    @trips = rider.trips
  end

  def new
    @rider = Rider.find(params[:rider_id])
    @trip = @rider.trips.build

  end
#id: rand(601...10000),
  def create
    rider = Rider.find(params[:rider_id])
    default_params = {date: Date.today, rating: nil, rider_id: rider.id, driver_id: rand(1..100)}
    @trip = rider.trips.create(default_params)
    @trip.update_attributes(trip_params)
    @trip.save
    if @trip.save
      redirect_to rider_path(@trip.rider_id)
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
    @trip = Trip.find(params[:id])
    @trip.update_attributes(rating_params)
    @trip.save
    # if @trip.save
    #   redirect_to trip_path(@trip)
    # else
    #   render :edit
    # end

  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to rider_path(@trip.rider_id)
  end

  private
  def trip_params
    return params.require(:trip).permit( :cost, :rating)
  end

  def rating_params
  params.require(:trip).permit(:rating)
  end
end
