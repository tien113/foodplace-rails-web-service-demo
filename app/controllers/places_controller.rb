class PlacesController < ApplicationController
  
  before_filter :signed_in_user, :except => :index # set authentication all methods on this controller except index method 
  
  # GET /places
  # GET /places.json
  def index
    @places = Place.all # fetch all places in database places

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @places.to_json( :except => [ :created_at, :updated_at, :id ] ) } # generate the data to json
    end
  end
  
  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find(params[:id]) # find the place with id
  end
  
  # GET /places/new
  # GET /places/new.json
  def new
    @place = Place.new # create new place 
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id]) # edit the place with id
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(params[:place]) # create the place with place data
    
    if @place.save # save the place
      redirect_to @place 
      flash[:success] = "Place was successfully created."
    else
      render action: "new" 
    end
  end

  # PUT /places/1
  # PUT /places/1.json
  def update
    @place = Place.find(params[:id]) # update place with id

    if @place.update_attributes(params[:place]) # update place with place data
      redirect_to @place
      flash[:success] = "Place was successfully updated."
    else
      render action: "edit" 
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place = Place.find(params[:id]).destroy
    flash[:success] = "Place destroyed."
    redirect_to places_url
  end
end
