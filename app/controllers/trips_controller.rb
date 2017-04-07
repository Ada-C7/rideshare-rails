class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy

    redirect_to trips_path
  end

  def edit
    @trip  = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new(params[:id])
  end

  def create
    rider = Rider.find(params[:rider_id])
<<<<<<< HEAD
    trip_info = {
      rider_id: Rider.find(params[:rider_id]),
      driver_id: 2,
      date: "Right freaking now",
      rating: -999
    }

    @trip = rider.trips.build(trip_info)
    # if @trip.save
    #   redirect_to trip_path(@trip.id)
    #   # else
    #   render :new
    # end
=======
    @trip = rider.trips.build(trip_params)
    if @trip.save
      redirect_to trip_path(@trip.id)
    else
      render :new
    end
>>>>>>> e01eac1351041e55868e8e6b7b703f2e2564dad4
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def update
    trip = Trip.find(params[:id])
    trip.update_attributes(trip_params)
    trip.save

    redirect_to trips_path
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :rider_id, :date, :rating)
  end

end
