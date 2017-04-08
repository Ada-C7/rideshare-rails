class TripsController < ApplicationController
  def index
    @trips = Trip.all
    #@rating = @trips_by_trip.average(:rating).round(1)
  end

  def new
    @trip = Trip.new
  end

  def create
    trip = Trip.new
    trip.driver_id = Driver.all.sample.id #driver object
    trip.passenger_id = params[:id]
    trip.date = Time.now.to_s
    trip.cost = rand(1..600)

    # Trip.create(trip_params) #params come from a form since no form, no need
    trip.save!
    redirect_to passengers_path
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update #not passing into view so could be local variable
    trip = Trip.find(params[:id])
    trip.update_attributes(trip_params)
    trip.save

    redirect_to trips_path
  end

  def destroy
    trip = Driver.find(params[:id])
    trip.destroy

    redirect_to trips_path
  end

  private
  def trip_params
    return params.require(:trip).permit(:rating) #coming from the form
  end


end
