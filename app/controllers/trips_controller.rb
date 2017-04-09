class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new #trip is only made via rider
    @rider = Rider.find(params[:id])
    @trip = Trip.new
    @trip.date = Date.current
  end

  def create
    rider = Rider.find(trip_params[:rider_id])
    if rider.rated_all_trips(rider) == true
      @trip = Trip.create! trip_params

      unless @trip.id == nil
        redirect_to trip_path(@trip.id)
      else
        render "new"
      end
    else
      flash[:notice] = 'Sorry, all previous trips must be rated before creating a new trip'
      redirect_to rider_path(rider.id)
    end
  end

  def edit
    @trip = Trip.find params[:id]
  end

  def update
    @trip = Trip.find params[:id]

    @trip.rating = trip_params[:rating]
    @trip.cost = rand(500..1000)

    if @trip.save
      redirect_to trip_path
    else
      render "edit"
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
