class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

# View one driver
  def show
    @passenger = Passenger.find(params[:id])
  end

# Create a driver
  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to passenger_path
    else
      #we know the validations didn't pass
      render :new
    end
  end

  # Edit a driver
  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    #this is something that I'm not sure it's right
    passenger = Passenger.find(params[:id])
    passenger.update(passanger_params)

    redirect_to passenger_path(passenger) #like do I need this or should it be somethign else?
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
