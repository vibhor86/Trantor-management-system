require 'csv'
require 'tempfile'
class DocumentController < ApplicationController
  
  def index
    @document_templates = DocumentTemplate.all
    if @document_templates.empty?
      redirect_to new_document_template_path 
    else
      default_template = DocumentTemplate.first
      @dropdown_temp_id = default_template.id.to_s
      @dropdown_temp_title = default_template.title
    end
  end
  
  def show
    @template_value = DocumentTemplate.find(params[:temp_value])
    respond_to do |format|
      format.pdf do
        render :pdf => "sample",
          :header => {:html => { :template => 'document/header.html.erb'}, :spacing => 5},
          :footer => {:html => { :template => 'document/footer.html.erb'}}
      end
    end
  end
  
  def document
    @selected_template = DocumentTemplate.find(params[:template])
    @template_body = @selected_template.body
    file_field = params[:form][:file]
    @file_content = file_field.read
    row_index = 0
    file = Tempfile.new(['document_file', '.csv'])
    file.write(@file_content)
    file.rewind
    
    CSV.foreach(Rails.root.join(file.path)) do |row|
      if row_index == 0
        @header=row
      end
      temp_template = @template_body.dup
      row_index += 1
      next if row_index == 1 or row.join.blank?

      @doc = search_replace(temp_template,row,@header)
      if (params[:check_header_footer] == 'Enable')
       allow_header_footer(@doc[:template])
      else
        no_header_footer(@doc[:template])
      end
     
      @filename = ("#{@doc[:ecode]}_#{@selected_template.title}_#{Time.now}").gsub(/\s+/, '')
     
      @save_path = Rails.root.join('pdfs', "#{@filename}.pdf")
      
      @encrypted_path = Rails.root.join('pdfs/encrypted', "#{@filename}.pdf") 
     
      File.open(@save_path,'wb') do |file|
        file << @pdf
      end
      system(" pdftk #{@save_path}  output #{@encrypted_path} user_pw #{@doc[:encrypt_field]} ")
       #raise @doc[:email].inspect
      AdminMailer.hr_document(@doc[:email],params[:subject],params[:email_body],@encrypted_path,params[:sender_email]).deliver
      system(" rm #{@save_path}")
      redirect_to "/document/index", :notice => "Emails have been sent successfully!"
    end
  end
  
  def search_replace(template,row,headers)
  headers.collect! {|i| i.downcase}
 
  @header_row_hash = Hash[headers.zip(row.map {|r| r.include?(',') ? (r.split /, /) : r})]

    placeholder_data = Placeholder.find(:all,:conditions => ["column_name IN (?)",headers])
    placeholder_data.each do |placeholder|
	template.gsub!(placeholder.placeholder_name, @header_row_hash[placeholder.column_name.downcase])
    end
    template_with_row_data = {:template =>template , 
      :encrypt_field => @header_row_hash[params[:encrypt_field]],
      :ecode => @header_row_hash["ecode"],
      :email => @header_row_hash["email"]
    }
  end

  def allow_header_footer(document)
    @pdf = render_to_string :pdf => document,
      :header => {:html => { :template => 'document/header.html.erb'}, :spacing => 5},
      :footer => {:html => { :template => 'document/footer.html.erb'}}
    return @pdf
  end

  def no_header_footer(document)
    @pdf = render_to_string :pdf => document
    return @pdf
  end
end
