# frozen_string_literal: true

class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def destroy
    Test.find(params[:id]).destroy
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

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
