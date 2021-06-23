# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    (0..3).include?(question.answers.count) || errors.add(:count)
  end
end
