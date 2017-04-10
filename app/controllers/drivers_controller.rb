class DriversController < ApplicationController
  def index
    @drivers = Driver.active_drivers
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.create driver_params

    unless @driver.id == nil
      redirect_to drivers_path
    else
      render "new"
    end

  end

  def show
    @selected_driver = Driver.find params[:id]
  end

  def edit
    @driver = Driver.find params[:id]
  end

  def update
    @driver = Driver.find params[:id]

    @driver.name = driver_params[:name]
    @driver.vin = driver_params[:vin]

    if @driver.save
      redirect_to driver_path
    else
      render "edit"
    end

  end


  def update_active
    @driver = Driver.find params[:id]
    @driver.active = false

    if @driver.save
      redirect_to drivers_path
    end
  end

  def destroy

    Driver.destroy(params[:id])
    redirect

  end

  private
  def driver_params
    params.require(:driver).permit(:name, :vin)
  end


end
