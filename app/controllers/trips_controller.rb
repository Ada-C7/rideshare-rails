class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new # if statement for brand new trip vs. trip via rider
    @rider = Rider.find(params[:id])
    @trip = Trip.new
    @trip.date = Date.current
  end

  def create
    @trip = Trip.create! trip_params

    puts @trip.errors.messages

    unless @trip.id == nil
      redirect_to trip_path(@trip.id)
    else
      render "new"  #need to add validations to trip model
    end

  end

  def show
    @selected_trip = Trip.find params[:id]
  end



  private

  def trip_params
    params.require(:trip).permit(:driver_id, :rider_id, :date, :rating, :cost)
  end

end
