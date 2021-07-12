# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def result
    correct_questions.to_f / test.questions.count * 100
  end

  def successful?
    result >= SUCCESS_PERCENT && !time_runs_out
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).size
  end

  def time_runs_out
    time_remaining.negative?
  end

  def time_remaining
    created_at + test.time.minutes - Time.current
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def next_question
    question = test.questions.order(:id).where('id > ?', current_question.id).first
    self.current_question = question
  end
end
