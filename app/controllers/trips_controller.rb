class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def create
  end
end
