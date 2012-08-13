class AdminMailer < ActionMailer::Base
  default :from => "suresh_torlapati@yahoo.com"

  def registration_confirmation(mail_details)
  attachments[File.basename("#{mail_details[3]}")] = File.read("#{mail_details[3]}")
    mail(:to => "<#{mail_details[0]}>", :subject => "#{mail_details[1]}", :body => "#{mail_details[2]}")
  end
end

