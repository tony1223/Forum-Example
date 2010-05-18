class PostsController < ApplicationController
  before_filter :find_forum
  before_filter :find_post, :only => [ :show, :edit, :update, :destroy]
  
  def find_forum
    @forum = Forum.find(params[:forum_id]) 
  end 
  def find_post
    @post = @forum.posts.find(params[:id])
  end
    
  def index 
    @posts=@forum.posts.find(:all)
  end
  
  def show
    #@post = Forum.find(params[:fid])
  end
  
  def new
      @post = @forum.posts.build
  end
  
  def create 
    @post =@forum.posts.build(params[:post])
    @post.save
    redirect_to :action => :index
  end
  
  def edit
  end
  
  def update
    @post.update_attributes(params[:post])
    
    redirect_to :action => :show,:id => @post
  end
  
  def destroy
    @post.destroy
    
    redirect_to :action => :index
  end
end
