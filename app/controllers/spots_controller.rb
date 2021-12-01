class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_spot, only: [:show, :edit, :update]

  def index
    @spots = Spot.order(updated_at: :desc)
  end

  def new
    @spot = Spot.new
  end

  def show    
  end

  def edit
  end  

  def create
    @spot = Spot.new(spot_params)
    binding.pry
    if @spot.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to root_path
    else
      spot :new
    end
  end

  def destroy
    @spot.destroy

    flash[:success] = "Your Post has been removed."
    redirect_to root_path
  end 

end

private

  def spot_params
    params.require(:spot).permit(
      :spot_name, 
      :area_id, 
      :postal_code, 
      :address, 
      :building, 
      :phone_number, 
      :image
    ).merge(user_id: current_user.id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
    
  end
