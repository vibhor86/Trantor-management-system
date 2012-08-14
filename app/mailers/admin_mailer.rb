class AdminMailer < ActionMailer::Base


  def hr_document(mail_details)
   attachments[File.basename("#{mail_details[3]}")] = File.read("#{mail_details[3]}")
   
    mail(:from => mail_details[4], :to => mail_details[0], :subject => mail_details[1], :body => "#{mail_details[2]}")
  end

end
