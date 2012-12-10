class Notifier < ActionMailer::Base

  def feedback(address, message)
    @message= message
    mail(:to => address, :from => message.email, :subject => "[100hours feedback] #{message.subject}")
  end

end
