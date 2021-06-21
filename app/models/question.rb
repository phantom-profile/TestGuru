# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  scope :correct_answers, -> { answers.where(correct: true) }
end
