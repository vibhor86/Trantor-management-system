
Wisepdf::Configuration.configure do |c|
  c.wkhtmltopdf = '/bin/wkhtmltopdf'
  c.options = {
    :use_xserver => true,
     :margin => {
      :bottom => 20,
      :left => 20,
      :right => 20
    },
      :page_size => 'A4',
  
  }

end
