class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[show destroy edit update]
  before_action :set_question, only: %i[show edit]

  def show
  end

  def new
    @answer = @question.answers.new
    puts "#{@answer.inspect}"
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      flash[:notice] = t('.success')
      redirect_to admin_answer_path(@answer)
    else
      render :new
    end
  end

  def destroy
    @answer.destroy
    flash[:notice] = t('.success')
    redirect_to admin_question_path(@answer.question)
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      flash[:notice] = t('.success')
      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(@answer.question_id)
  end
end
