class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.create(passenger_params)
    if @passenger.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])
    @passenger.update(passenger_params)
    if @passenger.save
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    Passenger.destroy(params[:id])
    redirect_to :root
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :phone)
  end
end
