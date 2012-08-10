class DocumentTemplatesController < ApplicationController
  # GET /document_templates
  # GET /document_templates.json
  before_filter :authenticate_user!
  
  def index
    @document_templates = DocumentTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_templates }
    end
  end

  
  # GET /document_templates/new
  # GET /document_templates/new.json
  def new
    @document_template = DocumentTemplate.new
    @placeholder_details=Placeholder.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_template }
    end
  end

  # GET /document_templates/1/edit
  def edit
    @placeholder_details=Placeholder.all
    @document_template = DocumentTemplate.find(params[:id])
  end

  # POST /document_templates
  # POST /document_templates.json
  def create
    @document_template = DocumentTemplate.new(params[:document_template])
    respond_to do |format|
      if @document_template.save
        format.html { redirect_to "/document/index", notice: 'Document template was successfully created.' }
        format.json { render json: "/document/index", status: :created, location: @document_template }
      else
        format.html { render action: "new" }
        format.json { render json: @document_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /document_templates/1
  # PUT /document_templates/1.json
  def update
    @document_template = DocumentTemplate.find(params[:id])

    respond_to do |format|
      if @document_template.update_attributes(params[:document_template])
        format.html { redirect_to "/document/index", notice: 'Document template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_templates/1
  # DELETE /document_templates/1.json
  def destroy
    @document_template = DocumentTemplate.find(params[:id])
    @document_template.destroy

    respond_to do |format|
      format.html { redirect_to document_templates_url }
      format.json { head :no_content }
    end
  end
end
