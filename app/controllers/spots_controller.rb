class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @spots = Spot.order(updated_at: :desc)
  end

  def new
    @spot = Spot.new
  end

  def edit
    @spot = Spot.find(params[:id])
  end  

  def create
    @spot = Spot.new(spot_params)
  end

end

private

  def spot_params
    params.require(:spot).permit(:spot_name, :area_id, :postal_code, :address, :building, :phone_number, :image).merge(user_id: current_user.id)
  end
