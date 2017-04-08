class TripsController < ApplicationController


  def new
     @trip = Trip.new
  end

  def create
    #message if driver = nil and no driver available
    trip_params = generate_params(params[:passenger_id])
    puts ">>>>> DPR"
    puts trip_params.to_hash
    trip = Trip.create(trip_params) if trip_params[:driver] != nil
    puts trip.errors.messages

    redirect_to passenger_path(params[:passenger_id])
  end


  def show
    @trip = Trip.find(params[:id])
  end


  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.assign_attributes(trip_params)

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  # strong params?
  def update_rating
    trip = Trip.find(params[:id])
    trip.update(params.permit(:rating))

    redirect_to passenger_path(trip.passenger)
  end

  def destroy
    Trip.find(params[:id]).destroy
    # where to redirect? passenger page?
    # redirect_to trips_path
  end

  private
  def trip_params
    return params.require(:trip).permit(:rating, :date, :cost)
  end

  def generate_params(passenger_id)
    {
      driver: Trip.find_driver,
      passenger_id: passenger_id,
      date: Date.today,
      cost: rand(1..5000)
    }
  end
end
