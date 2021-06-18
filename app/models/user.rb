# frozen_string_literal: true

class User < ApplicationRecord

  def completed_tests(level)
    Test.joins('INNER JOIN tests_users ON tests.id = tests_users.test_id')
        .joins('INNER JOIN users ON users.id = tests_users.user_id')
        .where('users.id': id, 'tests.level': level)
  end
end
