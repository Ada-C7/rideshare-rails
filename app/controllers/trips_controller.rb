class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @result_trip = Trip.find(params[:id])
  end

end
