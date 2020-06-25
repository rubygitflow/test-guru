class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbacksMailer.feedback_message(current_user, @feedback.body).deliver_now
      flash[:notice] = t('.success')
    else
      flash[:error] = t('.error')
    end
    redirect_to new_feedback_url
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
