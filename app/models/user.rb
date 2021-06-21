# frozen_string_literal: true

class User < ApplicationRecord
  has_many :written_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  def completed_tests(level)
    tests.where(level: level)
  end
end
