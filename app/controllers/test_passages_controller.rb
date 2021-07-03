# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    Gist.create(question: @test_passage.current_question.body,
                user: current_user.email,
                url: result.url)
    flash[:notice] = t('gist_created', link: view_context.link_to('Gist', result.html_url)).html_safe
  end

  private

  def test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
