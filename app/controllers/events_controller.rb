class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update]


  def index
    @events = Event.all.order('end_time asc')
  end

  def new
    @event = Event.new
  end




  def show
    @event = Event.find(params[:id])
  end
end

def create
  @event = Event.new(event_params)
  binding.pry
  if @event.save
    redirect_to root_path
  else
    render :new
  end
end

def update
  @event = Event.new(event_params)
  if @event.save
    redirect_to root_path
  else
    event :new
  end
end

def destroy
  @event.destroy

  flash[:success] = "Your Post has been removed."
  redirect_to root_path
end 


private
def event_params
  params.require(:event).permit(
    :event_name, 
    :image
  ).merge(user_id: current_user.id)
end

def set_event
  @event = Event.find(params[:id])
  

end