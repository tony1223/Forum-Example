class PostsController < ApplicationController
  before_filter :find_forum
  before_filter :login_required , :except => [:index , :show]
  
  
  def index 
    @posts = @forum.posts.paginate :page => params[:page], :order => "created_at DESC"
    
  end
  
  def show
    @post = @forum.posts.find(params[:id])
  end
  
  def new
    @post = @forum.posts.build
  end
  
  def create 
    @post = @forum.posts.build(params[:post])
    @post.user =current_user
    @post.save
    redirect_to forum_posts_path(@forum)
  end
  
  def edit
     @post = current_user.posts.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    @post.update_attributes(params[:post])
    redirect_to forum_post_path(@forum,@post)
  end
  
  def destroy
    
    @poster = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to forum_posts_path(@forum)
  end
  
  
  protected 
  def find_forum
    @forum = Forum.find(params[:forum_id]) 
  end 

end
