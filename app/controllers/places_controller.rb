class PlacesController < ApplicationController
  
  before_filter :signed_in?, :except => :index # set authentication all methods on this controller except index method 
  
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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @place } # generate the data to json
    end
  end
  
  # GET /places/new
  # GET /places/new.json
  def new
    @place = Place.new # create new place 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id]) # edit the place with id
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(params[:place]) # create the place with place data

    respond_to do |format|
      if @place.save # save the place
        format.html { redirect_to @place, notice: 'Place was successfully created.' } # redirect to show page if successfully
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" } # render new page again if unsuccessfully
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.json
  def update
    @place = Place.find(params[:id]) # update place with id

    respond_to do |format|
      if @place.update_attributes(params[:place]) # update place with place data
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" } # render edit page if unsuccessfully
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place = Place.find(params[:id]) # find place with id
    @place.destroy # destroy place 

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end
  
end
