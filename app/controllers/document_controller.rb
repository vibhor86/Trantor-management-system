class DocumentController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @document_templates=DocumentTemplate.all
    if @document_templates.empty?
      redirect_to new_document_template_path
    else
      default_template=DocumentTemplate.first
      @dropdown_temp_id=default_template.id.to_s
      @dropdown_temp_title=default_template.title
    end
  end
  
  
  def show
    @template_value= DocumentTemplate.find(params[:temp_value])
    respond_to do |format|
      format.pdf do
        render :pdf => "sample",
          :margin => {
          :bottom => 20,
          :left => 20,
          :right =>20
        },
          :page_size          => 'A4',
          :header => {:html => { :template => 'document/header.html.erb'}, :spacing => 5},
          :footer => {:html => { :template => 'document/footer.html.erb'}}
      end
    end

  end
  
  
  def document
    @selected_template= DocumentTemplate.find(params[:template])
    @template_body=@selected_template.body
    file_field = params[:form][:file]
    @file_content= file_field.read
    @file_data= @file_content.split("\n")
    row_index=0
    @file_data.each do |row_data|
      row= row_data.split(",")
      if row_index == 0
        @header=row
      end
      temp_template=@template_body.dup
      row_index += 1
      next if row_index == 1 or row.join.blank?
      @doc=search_replace(temp_template,row,@header)
      if (params[:check_header_footer]=='Enable')
        allow_header_footer(@doc[0])
      else
        no_header_footer(@doc[0])
      end
      @filename=(@doc[2]+'_'+@selected_template.title+'_'+Date.today.to_s).gsub(/\s+/, '')
      File.open("/home/aastha/Desktop/pdfs/#{@filename}.pdf",'wb') do |file|
        file << @pdf
      end
      system(" pdftk /home/aastha/Desktop/pdfs/#{@filename}.pdf  output /home/aastha/Desktop/pdfs/encryptedpdfs/#{@filename}.pdf user_pw #{@doc[1]} ")
      email_attachments
      redirect_to "/document/index", :alert => "Emails have been sent successfully!"

    end
  end
  
  def search_replace(template,row,headers)
    @header_row_hash=Hash[headers.zip(row.map {|i| i.include?(',') ? (i.split /, /) : i})]
    placeholder_data= Placeholder.find(:all,:conditions=>["column_name IN (?)",headers])
  
    placeholder_data.each do |placeholder|
      template.gsub!(placeholder.placeholder_name, @header_row_hash[placeholder.column_name])
    end
    template_with_row_data =[template,@header_row_hash[params[:encrypt_field]],@header_row_hash["ecode"],@header_row_hash["email"]]
    template_with_row_data
  end

  def email_attachments
    Pony.mail(
      :to                   => @doc[3],
      :from                 => params[:sender_email],
      :subject              => params[:subject],
      :html_body            => params[:email_body],
      :attachments          => {File.basename("#{@filename}.pdf") => File.read("/home/aastha/Desktop/pdfs/encryptedpdfs/#{@filename}.pdf")},
      :via                  => :smtp,
      :via_options          => {
        :address        => 'localhost',
        :port           => 1025
      }
    )
  
  end
 
  def allow_header_footer(document)
    @pdf = render_to_string :pdf => document,
      :margin => {
      :bottom => 20,
      :left => 20,
      :right =>20
    },
      :page_size          => 'A4',
      :header => {:html => { :template => 'document/header.html.erb'}, :spacing => 5},
      :footer => {:html => { :template => 'document/footer.html.erb'}}
    return @pdf
  end

  def no_header_footer(document)
    @pdf = render_to_string :pdf => document,
      :margin => {
      :bottom => 20,
      :left => 20,
      :right =>20
    },
      :page_size          => 'A4'
    return @pdf
  end
  
end
