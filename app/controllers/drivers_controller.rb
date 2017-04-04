class DriversController < ApplicationController
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
    @drivers = Driver.all
  #   driver_hash = {}
  #   driver_hash = drivers.map do |driver|
  #     driver_hash[:name]= driver.name
  #     driver_hash[:vin] = driver.vin
  #     driver_hash[:id] = driver.id
  # end
    # @drivers = driver_hash
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
