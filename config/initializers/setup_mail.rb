ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :address  => "smtp.gmail.com",
   :port  => 587,
   :user_name  => "sureshresume4154",
   :password  => "password",
   :authentication  => :plain
 }
#ActionMailer::Base.smtp_settings = {
#   :address  => "localhost",
#   :port  => 1025,
#
# }
