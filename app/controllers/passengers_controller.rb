class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    #this is something that I'm not sure it's right
    passenger = Passenger.find(params[:id])
    passenger.update_attributes(passanger_params)
    passenger.save

    redirect_to passenger_path(passenger) #like do I need this or should it be somethign else?
  end

  def create
    Passenger.create(passenger_params)
  end

  def destroy
    passenger = Passenger.find(params[:id])
    passenger.destroy

    redirect_to passenger_path
  end

  private
    def passanger_params
      return params.require(:passenger).permit(:name, :phone_num)
    end



end
