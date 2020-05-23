class TestPassagesController < ApplicationController
  before_action :find_test_passage

  def show
  end

  def result
  	@completed_percent = @test_passage.get_completed_percent
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
