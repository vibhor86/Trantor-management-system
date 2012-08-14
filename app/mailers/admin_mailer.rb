class AdminMailer < ActionMailer::Base


  def hr_document(recipient_email,email_subject,email_body,email_attachment_path,sender_email)
   attachments[File.basename("#{email_attachment_path}")] = File.read("#{email_attachment_path}")
   
    mail(:from => sender_email, :to => recipient_email, :subject => email_subject, :body => email_body)
  end

end
