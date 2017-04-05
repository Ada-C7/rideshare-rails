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
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
