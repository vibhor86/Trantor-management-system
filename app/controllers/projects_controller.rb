class ProjectsController < ApplicationController
  load_and_authorize_resource
  # GET /projects
  # GET /projects.json
  def all_record
    @project = Project.new
    @projects = Project.all
    @managers = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end
  
  def index
    @projects = Project.all
    @project = Project.new
    respond_to do |format|
      format.html { render :layout => false }
      format.json  { render :json => response }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

   respond_to do |format|
      if  @project.save
        format.json { render :json => {:valid => true, :designation =>  @project, :notice => " project was successfully created."}}
      else
        format.html { render action: "new" }
        format.json { render :json => {:valid => false, :errors =>  @project.errors}}
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

   respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        format.json { render :json => {:valid => true, :designation => @project, :notice => "project was successfully updated."} }
      else
        format.html { render action: "edit" }
        format.json {render :json => {:valid => false, :errors => @project.errors}}
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
     format.json { render :json => {:valid => true} }
    end
  end
end
