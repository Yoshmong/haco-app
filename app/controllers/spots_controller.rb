class SpotsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
  end

  def new
    @spot = Spot.new
  end

  def create
  end

end
