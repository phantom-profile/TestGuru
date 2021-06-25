# frozen_string_literal: true

class TestsController < ApplicationController

  before_action :test, only: %i[show]

  def show; end

  private

  def test
    @test = Test.find(params[:id])
  end
end
