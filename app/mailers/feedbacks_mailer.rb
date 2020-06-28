class FeedbacksMailer < ApplicationMailer
  def feedback_message(user, meassage_body)
    @user = user
    @message = meassage_body

    mail to: Admin.first.email, subject: "TestGuru Feedback"
  end
end
