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
    Passenger.create(passenger_params)

    redirect_to passengers_path
  end


private
  def passenger_params
    return params.require(:passenger).permit(:passenger_id, :name, :phone_num)
  end

end
