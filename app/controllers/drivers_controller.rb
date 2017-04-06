class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    @result_driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.name = driver_params[:name]
    @driver.lic_plate = driver_params[:lic_plate]
    @driver.vin = driver_params[:vin]
    if @driver.save
      redirect_to driver_path(@driver.id)
    end
  end

  def create
    @driver = Driver.create driver_params
    redirect_to drivers_path
  end

  def destroy
    Drivers.destroy(params[:id])
    redirect_to drivers_path
  end

  def rating
  end

  def driver_trips
  end

  # def earnings
  #   #questions here - this borrows from cost per trip in trips - should the math logic be in the model instead of the controller?
  # end

  private

  def driver_params
    params.require(:driver).permit(:name, :lic_plate, :vin)
  end

end
