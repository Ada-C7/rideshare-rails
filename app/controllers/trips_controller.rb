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
    @trips = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trips_path
    end



  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip}
      else
        format.html { render :edit }

      end
    end
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





end
