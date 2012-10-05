class OrderDetailsController < ApplicationController
  
  before_filter :signed_in_user
  
  # GET /order_details/new
  # GET /order_details/new.json
  def new
    @order = Order.find(params[:id])
    @orders = Order.all
  end
  
end
