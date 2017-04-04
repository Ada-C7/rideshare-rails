class RidersController < ApplicationController
    def index
      @riders = Rider.all
    end

    def new
      @task = Rider.new
    end

    def create
      Rider.create(rider_params)
    end

    def show
      @rider = Rider.find(params[:id])
    end

    def edit
      @rider = Rider.find(params[:id])
    end

    def update
      rider = Rider.find(params[:id])
      rider.update_attributes(rider_params)
      rider.save
    end

    def destroy
      @rider = Rider.find(params[:id])
      @rider.destroy
    end

    private
    def rider_params
      return params.require(:rider).permit(:name, :phone_num)
    end
end
