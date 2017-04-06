class PassengersController < ApplicationController


  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def create
    Passenger.create(passenger_params)
    redirect_to passengers_path
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])
    passenger.update_attributes(passenger_params)
    passenger.save
    redirect_to passengers_path(passenger)
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def destroy
  passenger = Passenger.find(params[:id])
  passenger.destroy

  redirect_to passengers_path
  end

  private
  def passenger_params
    return params.require(:passenger).permit(:id, :name, :phone_num)
  end


end
