class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all.order('end_time asc')
  end

  def show
    @event = Event.find(params[:id])
  end
end
