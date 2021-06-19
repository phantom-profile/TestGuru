# frozen_string_literal: true

class User < ApplicationRecord
  def completed_tests(level)
    Test
      .joins('JOIN user_tests ON user_tests.test_id = tests.id')
      .where(level: level, user_tests: { user_id: id })
  end
end
