# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :test, only: %i[show destroy edit update]

  def index
    @tests = Test.all
  end

  def show; end

  def destroy
    @test.destroy
  end

  def new
    @test = Test.new
  end

  def create
    # Не понял суть 4 задания, "назначать админа автором теста", у нас же пользователь - автор, а создавать
    # тест может только пользователь с правами админа, значит автором всегда назначается админ
    
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

  private

  def test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
