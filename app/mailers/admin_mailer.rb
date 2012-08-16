class AdminMailer < ActionMailer::Base


  def hr_document(recipient_email,email_subject,email_body,email_attachment,sender_email)


    attachments[File.basename(email_attachment)] = File.read(email_attachment)
   
    mail(:from => sender_email,
      :to => recipient_email,
      :subject => email_subject,
      :body => email_body)
  end

end
