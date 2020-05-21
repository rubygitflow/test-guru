class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      flash[:notice] = 'Test was successfully created.'
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    flash[:notice] = 'Test was successfully destroyed.'
    redirect_to tests_url
  end

  def edit
  end

  def update
    if @test.update(test_params)
    	flash[:notice] = 'Test was successfully updated.'
      redirect_to @test
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end