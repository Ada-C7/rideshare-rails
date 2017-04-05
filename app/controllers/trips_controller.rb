class TripsController < ApplicationController
  def index
  end

  def new
    @trip = Trip.new
    rider_id = params[:id]
    @rider = Rider.find(rider_id)
  end

  def create
    @trip = Trip.new
    @trip.date = Time.now
    @trip.rating  = nil



    @trip.save
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
