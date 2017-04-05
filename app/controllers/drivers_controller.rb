class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def new
  end

  def update
  end

  def delete
  end

  def show
    @result_driver = Driver.find(params[:id])

    @rating = []

    @result_driver.trips.each do |trip|
      @rating << trip.rating.to_f
    end

    @rating = (@rating.reduce(:+) / @rating.length).round(1)
  end
end
