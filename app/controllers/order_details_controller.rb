class OrderDetailsController < ApplicationController
  
  before_filter :logged_in?
  
  # GET /order_details/new
  # GET /order_details/new.json
  def new
    @order = Order.find(params[:id])
    @orders = Order.all
  end
  
end
