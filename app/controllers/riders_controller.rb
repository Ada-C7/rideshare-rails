class RidersController < ApplicationController
  def index
    @riders = Rider.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @rider = Rider.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
