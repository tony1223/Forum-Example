class ForumsController < ApplicationController
  before_filter :find_forum, :only => [ :show, :edit, :update, :destroy]
  before_filter :login_required , :except => [:index , :show]
  
  def index 
    @forums = Forum.paginate(:page => params[:page], :order => "created_at DESC")
    
  end
  
  def show 
    redirect_to forum_posts_path(@forum)
  end
  
  protected
  
  def find_forum
    @forum = Forum.find(params[:id])
  end
end
