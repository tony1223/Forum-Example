class Admin::UsersController < ApplicationController
  before_filter :login_required 
  before_filter :require_is_admin
  before_filter :find_user, :only => [ :show, :edit, :update, :destroy]  



  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_to(admin_users_path)
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => "new"
    end
  end
   

  
  def index 
    @users = User.paginate(:page => params[:page], :order => "created_at DESC")
  end
  
  def show 
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path
    else
      render :action => "edit"
    end
  end
  
  def destroy
    if @user.destroy
      redirect_to admin_users_path
    else
      render :action => "index"
    end 
  end
  
  protected
  
  def find_user
    @user = User.find(params[:id])
  end
  
end
