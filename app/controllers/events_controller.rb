class EventsController < ApplicationController
  def index
    @events = Event.find(:all)
  end
  
  def show
    @event = Event.find(params[:id])    
  end
  
  def new
    @event = Event.new
  end
  
  def create 
    @event=Event.new(params[:event])
    @event.save
    redirect_to :action =>:index
  end
  
  def edit
        @event=Event.find(params[:id])
  end
  def update
      @event=Event.find(params[:id])

      @event.update_attributes(params[:event])
      
      redirect_to :action => :show , :id => @event
  end 
  def destroy 
      @event =Event.find(params[:id])
      @event.destroy
      
      redirect_to :action =>:index
  end
end
