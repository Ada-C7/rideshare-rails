class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to driver_path(@driver.id)
    else
      render :new
    end
  end

  def new
    @driver = Driver.new
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update(driver_params)
      redirect_to driver_path(@driver.id)
    else
      render :edit
    end
  end

  def destroy
    Driver.find(params[:id]).destroy

    redirect_to drivers_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin)
  end
end
