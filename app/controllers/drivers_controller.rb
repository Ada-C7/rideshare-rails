class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    puts ">>>> AMV: In TasksController#create"
    Driver.create(driver_params)
    redirect_to drivers_path
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    driver = Driver.find(params[:id])
    driver.update_attributes(driver_params)
    driver.save
    redirect_to drivers_path(driver)
  end

  def destroy
    driver = Driver.find(params[:id])
    driver.destroy
    redirect_to drivers_path
  end
end
