class RidersController < ApplicationController



  def index
    @riders = Rider.all
  end

  def show
    @rider = Rider.find(params[:id])
  end

  def new
    @rider = Rider.new
  end


  def edit
    @rider = Rider.find(params[:id])
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]

  end

  def create
    @rider = Rider.create(rider_params)
    if @rider.save
      redirect_to riders_path
    end
  end


  def destroy
    rider = Rider.find(params[:id])
    rider.destroy
    redirect_to riders_path
    # @rider.destroy(params[:id])
    # respond_to do |format|
    #   format.html { redirect_to riders_url, notice: 'Rider was successfully destroyed.' }
    # end
  end

  def update
    @rider = Rider.find(params[:id])
    rider.update_attributes(rider_params)
    rider.save
    # redirect_to animal_path(animal)
    redirect_to session[:return_to]
  end


end



private

def rider_params
  params.require(:rider).permit(:name , :phone_num)
end
