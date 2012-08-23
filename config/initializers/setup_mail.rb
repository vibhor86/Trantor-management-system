 ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default :content_type => "text/html"
ActionMailer::Base.smtp_settings = {
  :user_name => "foundation3",
  :password => "71j2WG",
  :domain => "foundation3.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}