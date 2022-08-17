class FeedbackMailer < ApplicationMailer
  def send_message(feedback)
    @name = feedback.name
    @email = feedback.email
    @message = feedback.message

    mail to: '6024anton@gmail.com'
  end
end
