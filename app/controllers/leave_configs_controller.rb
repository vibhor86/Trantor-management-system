class LeaveConfigsController < ApplicationController
  # GET /leave_configs
  # GET /leave_configs.json
  def index
    @leave_configs = LeaveConfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leave_configs }
    end
  end

  # GET /leave_configs/1
  # GET /leave_configs/1.json
  def show
    @leave_config = LeaveConfig.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leave_config }
    end
  end

  # GET /leave_configs/new
  # GET /leave_configs/new.json
  def new
    @leave_config = LeaveConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leave_config }
    end
  end

  # GET /leave_configs/1/edit
  def edit
    @leave_config = LeaveConfig.find(params[:id])
  end

  # POST /leave_configs
  # POST /leave_configs.json
  def create
    @leave_config = LeaveConfig.new(params[:leave_config])

    respond_to do |format|
      if @leave_config.save
        format.html { redirect_to @leave_config, notice: 'Leave config was successfully created.' }
        format.json { render json: @leave_config, status: :created, location: @leave_config }
      else
        format.html { render action: "new" }
        format.json { render json: @leave_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leave_configs/1
  # PUT /leave_configs/1.json
  def update
    @leave_config = LeaveConfig.find(params[:id])

    respond_to do |format|
      if @leave_config.update_attributes(params[:leave_config])
        format.html { redirect_to @leave_config, notice: 'Leave config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leave_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_configs/1
  # DELETE /leave_configs/1.json
  def destroy
    @leave_config = LeaveConfig.find(params[:id])
    @leave_config.destroy

    respond_to do |format|
      format.html { redirect_to leave_configs_url }
      format.json { head :no_content }
    end
  end
end
