# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :test, only: %i[index new]
  before_action :question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<%= @test.questions.inspect %>'
  end

  def show
    render inline: '<%= @question.inspect %>'
  end

  def new; end

  def create
    Question.create(params.permit(:body, :test_id))
    redirect_to :test_questions
  end

  def destroy
    @question.destroy
    redirect_to :test_questions
  end

  private

  def test
    @test = Test.find(params['test_id'])
  end

  def question
    @question = Question.find(params['id'])
  end

  def rescue_with_question_not_found
    render plain: "question with id: #{params['id']} was not found"
  end
end
