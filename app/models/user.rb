# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def completed_tests(level)
    tests.where(level: level)
  end
end
