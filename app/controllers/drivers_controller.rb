class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
      @drivers = Driver.all
  end

  def create
    Driver.create(driver_params)
    #redirect_to #we can choose path together
  end

  def show
    id = params[:id].to_i
    @driver = Driver.find(id)
  end

  def edit
      id = params[:id].to_i
      @driver = Driver.find(id)
  end

  def update
    driver = Driver.find(params[:id])
    driver.update_attributes(driver_params)
    driver.save
    redirect_to driver_path
  end

  def destroy
    driver = Driver.find(params[:id])
    driver.destroy
    redirect_to drivers_path
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin, :id)
  end

end
