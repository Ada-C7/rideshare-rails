class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  # def find_passenger_trips
  #
  # end
end
