# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!, only: :start

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
end
