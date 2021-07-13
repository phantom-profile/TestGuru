# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController

  before_action :tests, only: %i[index update_inline]
  before_action :test, only: %i[show destroy edit update update_inline]

  def index; end

  def show; end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.written_tests.create(test_params)
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def test
    @test = Test.find(params[:id])
  end

  def tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :time)
  end
end
