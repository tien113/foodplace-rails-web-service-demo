class FoodsController < ApplicationController
  
  before_filter :logged_in?, :except => :index # set authentication all methods on this controller except index method 

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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food } # generate the data to json
    end
  end

  # GET /foods/new
  # GET /foods/new.json
  def new
    @food = Food.new # create new food 
    @places = Place.all # fetch all places

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food }
    end
  end

  # GET /foods/1/edit
  def edit
    @food = Food.find(params[:id]) # edit the food with id
    @places = Place.all
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(params[:food]) # create the food with food data
    @places = Place.all

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render json: @food, status: :created, location: @food }
      else
        format.html { render action: "new" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /foods/1
  # PUT /foods/1.json
  def update
    @food = Food.find(params[:id]) # find food with id

    respond_to do |format|
      if @food.update_attributes(params[:food])
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food = Food.find(params[:id])
    @food.destroy # destroy food

    respond_to do |format|
      format.html { redirect_to foods_url }
      format.json { head :no_content }
    end
  end  
end
