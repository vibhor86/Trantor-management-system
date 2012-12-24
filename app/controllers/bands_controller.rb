class BandsController < ApplicationController
  # GET /bands
  # GET /bands.json
  
  def all_record
    @band = Band.new
    @bands = Band.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bands }
    end
  end
  
  
  
  
  def index
    @bands = Band.all
    @band = Band.new
    respond_to do |format|
      format.html { render :layout => false }
      format.json  { render :json => response }
    end
  end

  # GET /bands/1
  # GET /bands/1.json
  def show
    @band = Band.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @band }
    end
  end

  # GET /bands/new
  # GET /bands/new.json
  def new
    @band = Band.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @band }
    end
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
  end

  # POST /bands
  # POST /bands.json
  def create
    @band = Band.new(params[:band])
    respond_to do |format|
      if  @band.save
        format.json { render :json => {:valid => true, :designation =>  @band, :notice => " band was successfully created."}}
      else
        format.html { render action: "new" }
        format.json { render :json => {:valid => false, :errors =>  @band.errors}}
      end
    end
  end

  # PUT /bands/1
  # PUT /bands/1.json
  def update
    @band = Band.find(params[:id])
    respond_to do |format|
      if @band.update_attributes(params[:project])
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { render :json => {:valid => true, :designation => @band, :notice => "band was successfully updated."} }
      else
        format.html { render action: "edit" }
        format.json {render :json => {:valid => false, :errors => @band.errors}}
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    respond_to do |format|
      format.html { redirect_to bands_url }
      format.json { render :json => {:valid => true} }
    end
  end
end
