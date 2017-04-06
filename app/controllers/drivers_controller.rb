class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    # using the bang will give a rails error message and tell you what validation failed
    @driver = Driver.new(driver_params)
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
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update_attributes(driver_params)
      redirect_to driver_path
    else
      render :edit
    end
    # update_attributes is calling save - because of validations?
    # so I don't need to call save
    # driver.save
    # redirect_to driver_path
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
