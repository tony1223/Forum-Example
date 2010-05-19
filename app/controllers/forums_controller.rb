class ForumsController < ApplicationController
  before_filter :find_forum, :only => [ :show, :edit, :update, :destroy]
  before_filter :login_required , :except => [:index , :show]
  
  def index 
    @forums = Forum.paginate :page => params[:page], :order => "created_at DESC"
    
  end
  
  def show 
    redirect_to forum_posts_path(@forum)
  end
  
  def new 
    @forum = Forum.new
  end
  
  def create 
    @forum = Forum.new(params[:forum])
    @forum.save
    redirect_to forums_path
  end
  
  def edit
  end
  
  def update
    @forum.update_attributes(params[:forum])
    
     redirect_to forums_path
  end
  
  def destroy
    @forum.destroy
    
    redirect_to forums_path
  end
  
  protected
  
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
