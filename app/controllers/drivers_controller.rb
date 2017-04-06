class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.create(driver_params)
    if @driver.save
      redirect_to :root
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
    @driver.update(driver_params)
    if @driver.save
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    Driver.destroy(params[:id])
    redirect_to :root
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin)
  end
end
