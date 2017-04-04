class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new(trip_params)
  end

  def create
    @trip = Trip.create(trip_params)
    if @trip.save
      redirect_to :root
    else
      render :new
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
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    Trip.destroy(params[:id])
    redirect_to :root
  end

  private

  def trip_params
    params.require(:trip).permit(:rating, :cost)
  end
end
