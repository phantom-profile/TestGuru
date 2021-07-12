# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed? || @test_passage.time_runs_out
      TestsMailer.completed(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
