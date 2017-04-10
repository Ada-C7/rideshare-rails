class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @result_trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.rating = trip_params[:rating]

    if trip.save
      redirect_to trip_path(trip.id)
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    if @trip.rand_driver != nil
      @trip.driver_id = @trip.rand_driver.id
    else
      render "create"
    end
    @trip.rider_id = params[:id]
    @trip.cost = (rand(0.00...100.00)).round(2)
    @trip.date = @trip.today_date

    if @trip.save
      redirect_to edit_trip_path(@trip.id)
    end
  end

  def destroy
    Trip.destroy(params[:id])
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:driver_id, :rider_id, :date, :rating)
  end

end
