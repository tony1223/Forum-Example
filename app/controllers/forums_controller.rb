class ForumsController < ApplicationController
  before_filter :find_forum, :only => [ :show, :edit, :update, :destroy]
  
  def find_forum
    @forum = Forum.find(params[:id])
  end   
  
  def index 
    @forums = Forum.find(:all) 
  end
  
  def show 
  end
  
  def new 
    @forum = Forum.new
  end
  
  def create 
    @forum = Forum.new(params[:forum])
    @forum.save
    redirect_to :action => :index
  end
  
  def edit
  end
  
  def update
    @forum.update_attributes(params[:forum])
    
    redirect_to :action => :show,:id => @forum
  end
  
  def destroy
    @forum.destroy
    
    redirect_to :action => :index
  end
end
