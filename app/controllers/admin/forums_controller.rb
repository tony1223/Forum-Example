class Admin::ForumsController < ApplicationController
  before_filter :login_required 
  before_filter :require_is_admin
  before_filter :find_forum, :only => [ :show, :edit, :update, :destroy]
  
  def index 
    @forums = Forum.paginate(:page => params[:page], :order => "created_at DESC")
  end
  
  def show 
  end
  
  def edit
  end
  
  def new 
    @forum = Forum.new
  end
  
  def create 
    @forum = Forum.new(params[:forum])
    if @forum.save
      redirect_to admin_forums_path
    else
      render :action => "new"
    end 
  end
  
  
  def update
    if @forum.update_attributes(params[:forum])
      redirect_to admin_forums_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    if @forum.destroy
      redirect_to admin_forums_path
    else
      render :action => "index"
    end 
  end
  
  protected
  
  def find_forum
    @forum = Forum.find(params[:id])
  end
  
end
