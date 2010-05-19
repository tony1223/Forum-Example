class PostsController < ApplicationController
  before_filter :find_forum
  before_filter :find_post, :only => [ :show, :edit, :update, :destroy]
  before_filter :login_required , :except => [:index , :show]
  before_filter :find_poster , :only => [:show , :edit,:destroy,:update]
  
  
  def index 
    @posts=@forum.posts.paginate :page => params[:page], :order => 'created_at DESC'
    
  end
  
  def show
  end
  
  def new
      @post = @forum.posts.build
  end
  
  def create 
    @post = @forum.posts.build(params[:post])
    @post[:user_id]=current_user[:id]
    @post.save
    redirect_to forum_posts_path(@forum)
  end
  
  def edit
    if current_user[:id] != @poster[:id] then
      redirect_to forum_posts_path(@forum)
    end 
  end
  
  def update
    if current_user[:id] != @poster[:id] then
      redirect_to forum_posts_path(@forum)
    end
    @post.update_attributes(params[:post])
    redirect_to forum_post_path(@forum,@post)
  end
  
  def destroy
    if current_user[:id] != @poster[:id] then
      redirect_to forum_posts_path(@forum)
    end
    @post.destroy
    redirect_to forum_posts_path(@forum)
  end
  
  
  protected 
  def find_poster
    @poster = User.find(@post[:user_id])
  end
  def find_forum
    @forum = Forum.find(params[:forum_id]) 
  end 
  def find_post
    @post = @forum.posts.find(params[:id])
  end
end
