class Admin::PostsController < ApplicationController
  before_filter :login_required 
  before_filter :require_is_admin
  before_filter :find_forum   
    
  def index 
    @posts = @forum.posts.paginate(:page => params[:page], :order => "created_at DESC")  
  end
  
  def show
    @post = @forum.posts.find(params[:id])
  end
  
  def new
    @post = @forum.posts.build
  end
  
  def create 
    @post = @forum.posts.build(params[:post])
    @post.user = current_user
    
    if @post.save
      redirect_to admin_forum_posts_path(@forum)
    else
      render :action => "new"
    end
  end
  
  def edit
     @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to admin_forum_post_path(@forum,@post)
    else
      render :action => "edit"
    end 
  end
  
  def destroy
    
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admin_forum_posts_path(@forum)
    else
      render :action => "index"
    end
  end
  
  
  protected 
  def find_forum
    @forum = Forum.find(params[:forum_id]) 
  end
end
