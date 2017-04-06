class DriversController < ApplicationController
  # DONE: drivers GET    /drivers(.:format)             drivers#index
  # POST   /drivers(.:format)             drivers#create
  # new_driver GET    /drivers/new(.:format)         drivers#new
  # edit_driver GET    /drivers/:id/edit(.:format)    drivers#edit
  # driver GET    /drivers/:id(.:format)         drivers#show
  # PATCH  /drivers/:id(.:format)         drivers#update
  # PUT    /drivers/:id(.:format)         drivers#update
  # DELETE /drivers/:id(.:format)         drivers#destroy

  def index
    @drivers = Driver.all
  end

  def create
    Driver.create(driver_params)

    redirect_to driver_path
  end

  def new
    @driver = Driver.new
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def driver_params
    return params.require(:driver).permit(:driver_id, :name, :vind)
  end
end
