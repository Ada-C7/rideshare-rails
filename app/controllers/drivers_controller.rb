class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @result_driver = Driver.find(params[:id])
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.name = driver_params[:name]
    @driver.vin = driver_params[:vin]
    # not sure how we will pull in availability since not in CSV
    @driver.availability = driver_params[:availability]

    if @driver.update(driver_params)
      redirect_to driver_path(@driver.id)
    else
      render "edit"
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.create driver_params

    if @driver.id != nil
      redirect_to drivers_path
    else
      render "new"
    end
  end

  def destroy
    Driver.destroy(params[:id])

    redirect_to drivers_path
  end

  def change_availability
    driver = Driver.find(params[:id])
    # driver.availability = false
    if driver.availability == false
      driver.availability = true
    else
      driver.availability = false
      # raise
    end
    if driver.save
        # render plain: "show"
        # driver.available
      redirect_to driver_path(driver.id)
    end
  end

    # def available
    #   driver = Driver.find(params[:id])
    #   driver.availability = true
    #
    #   if driver.save
    #     redirect_to driver_path(driver.id)
    #   end
  # end



  private

  def driver_params
    params.require(:driver).permit(:name, :vin, :availability)
  end

end
