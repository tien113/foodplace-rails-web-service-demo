class UsersController < ApplicationController
  
  before_filter :signed_in?
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action => 'new', :notice => "Signed up!"
    else
      render "new"
    end
  end
  
end
