class QuestionsController < ApplicationController
  before_action :find_test, only: %i[show index new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    # https://api.rubyonrails.org/classes/ActiveModel/Errors.html
    if @question.save
      flash[:notice] = 'Question was successfully created.'
      # https://apidock.com/rails/v2.3.8/ActionController/Base/redirect_to
      redirect_to test_path(@question.test)
    else
      redirect_to new_test_question_url(@test)
    end
  end

  def destroy
    @question.destroy
    flash[:notice] = 'Question was successfully destroyed.'
    # https://apidock.com/rails/v2.3.8/ActionController/Base/redirect_to
    redirect_to test_path(@question.test)
  end

  def edit
  end

  def update
    if @question.update(question_params)
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:notice] = 'Question was successfully updated.'
      redirect_to @question
    else
      # https://apidock.com/rails/ActionController/Base/render
      # http://rusrails.ru/layouts-and-rendering-in-rails
      render :edit
    end
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
