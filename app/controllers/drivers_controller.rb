class DriversController < ApplicationController


  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.create(driver_params)
    redirect_to drivers_path
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    driver = Driver.find(params[:id])
    driver.update(driver_params)

    redirect_to driver_path(driver)
  end

  def destroy
    Driver.find(params[:id]).destroy

    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end
