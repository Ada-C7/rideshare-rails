class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order("created_at ASC")
    if params[:search]
      @passengers = @passengers.search(params[:search]).order("created_at ASC")
    else
      @passengers = @passengers.all.order("created_at ASC")
    end
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
    @passenger = Passenger.find(params[:id])
    ptrips = @passenger.trips.count
    count = 0
    @passenger.trips.each do |trip|
      trip.destroy
      count += 1
    end
    puts "deleted #{count} out of #{ptrips} trips for #{@passenger.name}"
    Passenger.destroy(params[:id])
    puts "deleted #{@passenger.name}"
    redirect_to :root
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :phone)
  end
end
