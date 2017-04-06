class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passengers = Passenger.all
  end

end
