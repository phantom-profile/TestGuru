# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :test, only: %i[show destroy edit update start]

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
    @test = Test.create(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def start
    # @user = User.find(params[:user_id])
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
