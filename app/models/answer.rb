# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:count) unless (0..3).include?(question.answers.count)
  end
end
