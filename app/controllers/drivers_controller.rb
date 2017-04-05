class DriversController < ApplicationController
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
    @driver = Driver.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
