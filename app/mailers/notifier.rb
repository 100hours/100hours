class Notifier < ActionMailer::Base

  def feedback(address, message)
    @body = message.body
    mail(:to => address, :from => message.email, :subject => "[100hours feedback] #{message.subject}")
  end

end
