class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    driver = Driver.create driver_params

    if driver.save
      redirect_to drivers_path
  end

  def update
    driver = Driver.find(params[:id])

    driver.name = params[:driver][:name]
    driver.vin = params[:driver][:vin]

    if driver.save
      redirect_to driver_path
    end

  end

  def delete
    Driver.destroy(params[:id])

    redirect_to drivers_path
  end



  def show
    @result_driver = Driver.find(params[:id])

    @rating = []

    @result_driver.trips.each do |trip|
      @rating << trip.rating.to_f
    end

    @rating = (@rating.reduce(:+) / @rating.length).round(1)
  end

  private

  def driver_params
    params.require(:animal).permit(:name, :vin)
  end
end
