class FoodsController < ApplicationController
  
  before_filter :signed_in_user, :except => :index # set authentication all methods on this controller except index method 

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all # fetch all foods in database foods

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @foods.to_json(
                              :except => [ :created_at, :updated_at, :place_id ], 
                              :include => { :place => { :except => [ :created_at, :updated_at ] }
                                          } ) } # generate the data to json
    end
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    @food = Food.find(params[:id]) # find the food with id
  end

  # GET /foods/new
  # GET /foods/new.json
  def new
    @food = Food.new # create new food
  end

  # GET /foods/1/edit
  def edit
    @food = Food.find(params[:id]) # edit the food with id
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(params[:food]) # create the food with food data
    
    if @food.save
      redirect_to @food
      flash[:success] = "Food was successfully created."
    else
      render action: "new"
    end
  end

  # PUT /foods/1
  # PUT /foods/1.json
  def update
    @food = Food.find(params[:id]) # find food with id

    if @food.update_attributes(params[:food])
      redirect_to @food
      flash[:success] = "Food was successfully updated." 
    else 
      render action: "edit"
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food = Food.find(params[:id]).destroy # destroy food
    flash[:success] = "Food destroyed."
    redirect_to foods_url
  end  
end
