class AdminMailer < ActionMailer::Base


  def hr_document(recipient_email,email_subject,email_body,email_attachment,sender_email)


    attachments[File.basename(email_attachment)] = File.read(email_attachment)
   
    mail(:from => sender_email,
      :to => recipient_email,
      :subject => email_subject,
      :body => email_body)
  end

  def unconfirmation_mail message , user
     mail(:from => user.email,
      :to => hr_email,
      :subject => "reason for unconfirm",
      :body => message)
  end
  def exceed  message , user , user_to, hr 
      email =   hr ? "mahinder124@gmail.com" : user_to.email
     mail(:from => user.email,
      :to => email,
      :subject => "Notification For EL",
      :body => message)
  end
  
end
