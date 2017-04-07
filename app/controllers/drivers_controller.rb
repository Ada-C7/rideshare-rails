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

end
