class DriversController < ApplicationController
     def index
          @drivers = Driver.all
     end

     def show
          @driver = Driver.find(params[:id])
     end

     def new
          @driver = Driver.new
     end

     def create
          @driver = Driver.create driver_params

          if @driver.id  != nil
              redirect_to drivers_path
          else
               render "new"
          end
     end

     def driver_params
       params.require(:driver).permit(:name, :vin, :status)
     end
end
