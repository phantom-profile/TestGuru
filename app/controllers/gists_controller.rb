# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = Github::CreateGist.new(@test_passage.current_question).call
    if result.success?
      Gist.create(question: @test_passage.current_question.body,
                  user: current_user.email,
                  url: result.url)
      flash[:notice] = t('gist_created', link: view_context.link_to('Gist', result.html_url)).html_safe
    else
      flash[:alert] = t 'gist_not_created'
    end
    redirect_to @test_passage
  end
end
