class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.create(passenger_params)
    redirect_to passengers_path unless passenger.id == nil
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :phone)
  end
end
