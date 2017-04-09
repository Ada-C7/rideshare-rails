class DriversController < ApplicationController
     def index
          @drivers = Driver.all
          @passengers = Passenger.all
          @trips = Trip.all
     end

     def show
          @driver = Driver.find(params[:id])
          @passengers = Passenger.all
          @trips = Trip.all
     end

     def new
          @driver = Driver.new
          @passengers = Passenger.all
          @trips = Trip.all
     end

     def create
          @driver = Driver.create driver_params

          if @driver.id  != nil
              redirect_to drivers_path
          else
               render "new"
          end
     end

     def edit
       @driver = Driver.find(params[:id])
       @passengers = Passenger.all
       @trips = Trip.all
     end

     def update
          @driver = Driver.find(params[:id])

          @driver.name = driver_params[:name]
          @driver.vin = driver_params[:vin]
          @driver.status = driver_params[:status]

          if @driver.save
               redirect_to driver_path
          else
               render 'edit'
          end
     end

     def destroy
       Driver.destroy(params[:id])

       redirect_to drivers_path
     end

     private

     def driver_params
       params.require(:driver).permit(:name, :vin, :status)
     end
end
