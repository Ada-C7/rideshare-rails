class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trips = Trip.new
  end


  def edit
    @trip = Trip.find(params[:id])
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end



end

def update
  trip = Trip.find(params[:id])
  trip.update_attributes(trip_params)
  trip.save
  # redirect_to animal_path(animal)
  redirect_to session[:return_to]
end


def destroy
  trip = Trip.find(params[:id])
  trip.destroy
  redirect_to trips_path

end





private

def trip_params
  params.require(:trip).permit(:rider_id , :driver_id , :date , :rating , :created_at )
end
