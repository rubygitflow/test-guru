class FeedbacksController < ApplicationController
  def new
  end

  def create
    message = params[:feedback_body]
    if message.blank?
      flash[:danger] = t('.error')
    else
      FeedbacksMailer.feedback_message(current_user, message).deliver_now
      flash[:success] = t('.success')
    end
    redirect_to new_feedback_url
  end
end
