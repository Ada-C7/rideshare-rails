class DriversController < ApplicationController
# View all drivers
  def index
    @drivers = Driver.all
  end

# View one driver
  def show
    @driver = Driver.find(params[:id])
  end

# Create a driver
  def new
    @driver = Driver.new
  end

  def create
    Driver.create(driver_params)
    redirect_to driver_path
  end

# Edit a driver
  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    driver = Driver.find(params[:id])
    driver.update(driver_params)

    redirect_to driver_path(driver)
  end

# Delete a driver
  def destroy
    Driver.find(params[:id]).destroy
    redirect_to driver_path
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
