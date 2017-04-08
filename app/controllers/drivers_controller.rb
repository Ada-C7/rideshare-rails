class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @result_driver = Driver.find(params[:id])
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])

    if @driver.update(driver_params)
      redirect_to driver_path
    else
      render "edit"
    end
  end

  def available
    driver = Driver.find(params[:id])
    if driver.available
       driver.available = false
    else
      driver.available = true
    end

    if driver.save
      redirect_to driver_path
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.create driver_params
    if @driver.id != nil
      redirect_to drivers_path
    else
      render "new"
    end
  end

  def destroy
    Driver.destroy(params[:id])
    redirect_to drivers_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin, :available)
  end
end
