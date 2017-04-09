class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new

  end

  def create
    @driver = Driver.create(driver_params)
    @driver.save
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def show
    @driver = Driver.find(params[:id])
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
    return params.require(:driver).permit(:name, :vin)
  end

end
