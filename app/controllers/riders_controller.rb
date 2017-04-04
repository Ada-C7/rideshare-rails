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
      @rider = Rider.new
  end

  def create
      @rider = Rider.create(rider_params)
      if @rider.save
        redirect_to riders_path
      end
  end

  def update
    respond_to do |format|
      if @rider.update(rider_params)
        format.html { redirect_to @rider, notice: 'Rider was successfully updated.' }
        format.json { render :show, status: :ok, location: @rider }
      else
        format.html { render :edit }

      end
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





  private

    def rider_params
      params.require(:rider).permit(:name , :phone_num)
    end



end
