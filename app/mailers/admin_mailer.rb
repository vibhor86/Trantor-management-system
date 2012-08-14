class AdminMailer < ActionMailer::Base
  default :from => "aastha.tangri@trantorinc.com"
 
  def welcome_email(user)
  attachments[File.basename("#{@filename}.pdf")]= File.read("#{@encrypted_path}")
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
