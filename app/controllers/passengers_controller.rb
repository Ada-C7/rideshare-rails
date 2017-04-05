class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def show
    @result_passenger = Passenger.find(params[:id])
  end

  def create
    @passenger = Passenger.create passenger_params

    if @passenger.id != nil
      redirect_to passengers_path
    else
      render "new"
    end
  end

  def new
    @passenger = Passenger.new
  end

  private

  def passenger_params
    params.require(:passenger).permit(:id, :name, :phone_num)
  end

end
