class DocumentTemplatesController < ApplicationController
   
  def index
    @document_templates = DocumentTemplate.all
    respond_to do |format|
      format.html
      format.json { render json: @document_templates }
    end
  end
  
  def show
    @letter_template = LetterTemplate.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @letter_template }
    end
  end
  
  def new
    @document_template = DocumentTemplate.new
    @placeholder_details=Placeholder.all
    respond_to do |format|
      format.html
      format.json { render json: @document_template }
    end
  end

  def edit
    @placeholder_details=Placeholder.all
    @document_template = DocumentTemplate.find(params[:id])
  end

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

  def destroy
    @document_template = DocumentTemplate.find(params[:id])
    @document_template.destroy
    respond_to do |format|
      format.html { redirect_to document_templates_url }
      format.json { head :no_content }
    end
  end
end
