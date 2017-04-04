class DriverController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
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
  end

  def update
  end

  def destroy
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :vin, :id)
  end

end
