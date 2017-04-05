class PassengersController < ApplicationController


  def index
    @passengers = Passenger.all
  end

  def create
    Passenger.create(passenger_params)
    redirect_to passengers_path
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  private
  def passenger_params
    return params.require(:passenger).permit(:id, :name, :phone_num)
  end


end
