class UsersController < ApplicationController
  before_filter :login_required
  before_filter :tagcloud
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "New user created. You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
