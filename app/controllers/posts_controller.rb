class PostsController < ApplicationController
  before_filter :find_forum
  before_filter :login_required , :except => [:index , :show]
  
  
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
      redirect_to forum_posts_path(@forum)
    else
      render :action => "new"
    end
  end
  
  def edit
     @post = current_user.posts.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to forum_post_path(@forum,@post)
    else
      render :action => "edit"
    end 
  end
  
  def destroy
    
    @poster = current_user.posts.find(params[:id])
    if @post.destroy
      redirect_to forum_posts_path(@forum)
    else
      render :action => "index"
    end
  end
  
  
  protected 
  def find_forum
    @forum = Forum.find(params[:forum_id]) 
  end 

end
