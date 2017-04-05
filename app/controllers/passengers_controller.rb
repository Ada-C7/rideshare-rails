class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def show
    @result_passenger = Passenger.find(params[:id])
  end

  def create
    @passenger = Passenger.create passenger_params

    if @passenger.passenger_id != nil
      redirect to passengers_path
    else
      render "new"
    end
  end

  def new
    @passenger = Passenger.new
  end

  private

  def passenger_params
    params.require(:passenger).permit(:passenger_id, :name, :phone_num)
  end

end
