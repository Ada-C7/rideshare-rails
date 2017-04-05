class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @result_driver = Driver.find(params[:id])
  end

  def create
    @driver = Driver.create driver_params

    if @driver.id != nil
      redirect_to drivers_path
    else
      render "new"
    end
  end

  def new
    @driver = Driver.new
  end

  private

  def driver_params
    params.require(:driver).permit(:id, :name, :vin)
  end

end
