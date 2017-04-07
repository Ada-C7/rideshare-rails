class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order("created_at ASC")
    if params[:search]
      @drivers = @drivers.search(params[:search]).order("created_at ASC")
    else
      @drivers = @drivers.all.order("created_at ASC")
    end
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
    @driver = Driver.find(params[:id])
    dtrips = @driver.trips.count
    count = 0
    @driver.trips.each do |trip|
      trip.destroy
      count += 1
    end
    puts "deleted #{count} out of #{dtrips} trips for #{@driver.name}"
    Driver.destroy(params[:id])
    puts "deleted #{@driver.name}"
    redirect_to :root
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin)
  end
end
