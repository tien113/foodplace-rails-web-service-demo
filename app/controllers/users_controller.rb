class UsersController < ApplicationController
  
  before_filter :signed_in?
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Signed up!"
      redirect_to :action => 'new'
    else
      render "new"
    end
  end
  
end
