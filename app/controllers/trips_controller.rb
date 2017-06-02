class TripsController < ApplicationController
  def index
    @trips = Trip.all.order("created_at ASC")
    if params[:search_date]
      @trips = @trips.search_date(params[:search_date]).order("created_at ASC")
    elsif params[:search_passenger]
      @trips = @trips.search_passenger(params[:search_passenger]).order("created_at ASC")
    elsif params[:search_driver]
      @trips = @trips.search_driver(params[:search_driver]).order("created_at ASC")
    elsif params[:search_rating]
      @trips = @trips.search_rating(params[:search_rating]).order("created_at ASC")
    elsif params[:search_cost]
      @trips = @trips.search_cost(params[:search_cost]).order("created_at ASC")
    else
      @trips = @trips.all.order("created_at ASC")
    end
  end

  def create
    passenger = Passenger.find(params[:passenger_id])
    if passenger.all_trips_rated?
      @trip = Trip.new
      @trip.date = Date.current
      @trip.rating = 0
      @trip.cost = rand(5.0..30.0).round(2)
      @trip.driver_id = Driver.assign_driver
      # @trip.driver = Driver.all.sample
      @trip.passenger_id = params[:passenger_id]
      if @trip.save
        redirect_to passenger_path(params[:passenger_id])
      else
        redirect_to passenger_path(params[:passenger_id])
      end
    else
      flash[:failure] = "Please rate all trips before creating a new trip!"
      redirect_to passenger_path(params[:passenger_id])
    end
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if @trip.save
      redirect_to trip_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    passenger = @trip.passenger
    Trip.destroy(params[:id])
    redirect_to passenger_path(passenger.id)
  end

  private

  def trip_params
    params.require(:trip).permit(:rating, :cost)
  end
end
