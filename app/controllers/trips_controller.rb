class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def create
    @trip = Trip.new
    @trip.rider_id = params[:rider_id]
    @trip.driver = Driver.all.sample
    @trip.date = Date.today
    @trip.fare = rand(6..35.0).round(2)

    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      redirect_to rider_path(params[:rider_id])
    end
  end

  def edit
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
