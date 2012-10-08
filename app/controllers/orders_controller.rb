class OrdersController < ApplicationController
  
  before_filter :signed_in_user, except: [:create]
  
  # GET /orders
  # GET /orders.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: OrdersDatatable.new(view_context) }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.json { render json: @order }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order])
     redirect_to @order
     flash[:success] = "Order was successfully updated."  
    else
      render action: "edit" 
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id]).destroy
    flash[:success] = "Order destroyed."
    redirect_to orders_url
  end
end
