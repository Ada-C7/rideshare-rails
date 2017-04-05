class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @result_driver = Driver.find(params[:id])
  end
end
