class TripsController < ApplicationController
  def index
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    @trip.date = Time.now
    @trip.rating  = nil
    @trip.rider_id = params[:rider_id]
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
