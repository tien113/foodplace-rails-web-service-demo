class OrderDetailsController < ApplicationController
  
  before_filter :signed_in_user

  def show
    @order = Order.find(params[:id])
  end
  
end
