class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    # https://apidock.com/rails/ActionController/Base/render
    # http://rusrails.ru/layouts-and-rendering-in-rails
    render plain: @question.body
  end

  def new
  end

  def create
    @question = @test.questions.create(question_params)
    # https://apidock.com/rails/v2.3.8/ActionController/Base/redirect_to
    redirect_to test_questions_url
  end

  def destroy
    @question.destroy
    # https://apidock.com/rails/v2.3.8/ActionController/Base/redirect_to
    redirect_to action: 'index'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render html: '<h2>Question not found.</h2>'.html_safe
  end
end
