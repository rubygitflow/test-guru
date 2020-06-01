class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy edit update]
  before_action :set_test, only: %i[show edit]

  # https://progi.pro/obrabotka-oshibok-s-pomoshyu-grape-rails-i-activerecord-10066234
  rescue_from ActiveRecord::RecordNotFound do |e|
    rescue_with_question_not_found(e.message)
  end

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
      flash[:notice] = t('.success')
      # https://apidock.com/rails/v2.3.8/ActionController/Base/redirect_to
      redirect_to admin_test_questions_path(@question.test)
    else
      redirect_to new_admin_test_question_url(@test)
    end
  end

  def destroy
    @question.destroy
    flash[:notice] = t('.success')
    # https://apidock.com/rails/v2.3.8/ActionController/Base/redirect_to
    redirect_to admin_test_path(@question.test)
  end

  def edit
  end

  def update
    if @question.update(question_params)
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:notice] = t('.success')
      redirect_to admin_question_path(@question)
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

  def set_test
    @test = Test.find(@question.test_id)
  end

  def find_question
    puts "#{params.inspect}"
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found(error_message)
    # We don't now, which record, Test or Question is wrong
    render html: "<h2>#{error_message}.</h2>".html_safe
  end
end
