class DriversController < ApplicationController
  helper_method :say

  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    driver = Driver.create driver_params
    unless driver.id == nil
        redirect_to drivers_path
    end
  end

  def edit
    @driver = Driver.find(params[:id])

  end


  def update
    driver = Driver.find(params[:id])

    driver.name = params[:driver][:name]
    driver.vin = params[:driver][:vin]

    if driver.save
      redirect_to driver_path(driver.id)
    end
  end

  def destroy
    Driver.destroy(params[:id])

    redirect_to drivers_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin)

  end
end
