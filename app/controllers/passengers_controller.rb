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

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])
    if passenger.update(passenger_params)
      redirect_to passenger_path
    end
  end

  def destroy
    Passenger.destroy(params[:id])
    redirect_to passengers_path
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :phone)
  end
end
