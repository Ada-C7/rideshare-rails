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
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin)
  end
end
