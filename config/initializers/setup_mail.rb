ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default :content_type => "text/html"
ActionMailer::Base.smtp_settings = {
  :user_name => "raman.bedi@trantorinc.com",
  :password => "493d3174-2694-46bc-9ff6-9cb9aa394402",
  :domain => "mandrillapp.com",
  :address => "smtp.mandrillapp.com",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}