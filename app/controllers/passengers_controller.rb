class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @result_passenger = Passenger.find(params[:id])
  end

  def edit
    @result_passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])

    @passenger.name = passenger_params[:name]
    @passenger.phone_num = passenger_params[:phone_num]

    if @passenger.save
      redirect_to passenger_path(@passenger.id)
    end
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :phone_num)
  end

end
