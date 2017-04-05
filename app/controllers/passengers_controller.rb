class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def show
    @result_passenger = Passenger.find(params[:id])
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    @passenger = Passenger.find(params[:id])

    @passenger.name = passenger_params[:name]
    @passenger.phone_num = passenger_params[:phone_num]

    if @passenger.save
      redirect_to passenger_path(@passenger.id)
    else
      render "edit"
    end

  end

  def destroy
    Passenger.destroy(params[:id])

    redirect_to passengers_path
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
