class ForumsController < ApplicationController
  before_filter :find_forum, :only => [ :show, :edit, :update, :destroy]
  
  def index 
    @forums = Forum.paginate(:page => params[:page], :order => "created_at DESC")
    
  end
  
  def show 
    redirect_to forum_posts_path(@forum)
  end
  
  def new 
    @forum = Forum.new
  end
  
  def create 
    @forum = Forum.new(params[:forum])
    if @forum.save
      redirect_to forums_path
    else
      render :action => "new"
    end 
  end
  
  def edit
  end
  
  def update
    if @forum.update_attributes(params[:forum])
      redirect_to forums_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    if @forum.destroy
      redirect_to forums_path
    else
      render :action => "index"
    end 
  end
  
  protected
  
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
