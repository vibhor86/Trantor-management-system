class LeavemanagementsController < ApplicationController
  # GET /leavemanagements
  # GET /leavemanagements.json
  def index
    @leavemanagements = Leavemanagement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leavemanagements }
    end
  end

  # GET /leavemanagements/1
  # GET /leavemanagements/1.json
  def show
    @leavemanagement = Leavemanagement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leavemanagement }
    end
  end

  # GET /leavemanagements/new
  # GET /leavemanagements/new.json
  def new
    @leavemanagement = Leavemanagement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leavemanagement }
    end
  end

  # GET /leavemanagements/1/edit
  def edit
    @leavemanagement = Leavemanagement.find(params[:id])
  end

  # POST /leavemanagements
  # POST /leavemanagements.json
  def create
    @leavemanagement = Leavemanagement.new(params[:leavemanagement])
    @leavemanagement.user_id =  current_user.id
    respond_to do |format|
      if @leavemanagement.save
        format.html { redirect_to @leavemanagement, notice: 'Leavemanagement was successfully created.' }
        format.json {render :json => {:data => params }}
      else
        format.html { render action: "new" }
        format.json { render json: @leavemanagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leavemanagements/1
  # PUT /leavemanagements/1.json
  def update
    @leavemanagement = Leavemanagement.find(params[:id])
    respond_to do |format|
      if @leavemanagement.update_attributes(params[:leavemanagement])
        format.html { redirect_to @leavemanagement, notice: 'Leavemanagement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leavemanagement.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /leavemanagements/1
  # DELETE /leavemanagements/1.json
  def destroy
    @leavemanagement = Leavemanagement.find(params[:id])
    @leavemanagement.destroy
    respond_to do |format|
      format.html { redirect_to leavemanagements_url }
      format.json { head :no_content }
    end
  end

  def add
    event = Event.new(params[:data])
    respond_to do |format|
      format.json {render :json => {:data => params }}
    end
  end
end
