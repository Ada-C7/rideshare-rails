class TripsController < ApplicationController
before_action :find_rider, only: [:create]

  # def index
  #     # redirect_to :controller => 'riders', :action => 'trip_list'
  #     @trips = Trip.where(rider_id: @rider.id)
  # end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def find_rider
    @rider = Rider.find(params[:rider_id])
  end

  def create
    @trip = @rider.trip_request

    if @trip.save
      redirect_to rider_path(@rider)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update_attributes(trip_params)

    if @trip.save
      redirect_to rider_trips_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    @id_destroyed = trip.rider_id
    trip.destroy

    redirect_to rider_path(@id_destroyed)
  end

  private

  def trip_params
      return params.require(:trip).permit(:date, :driver_id, :rider_id, :rating)
  end

end
