# frozen_string_literal: true

# Tests of different categories with questions and answers
class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: :author_id, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  def self.by_category(category)
    Category.find_by(title: category)
      .tests
      .order(title: :desc)
      .pluck(:title)
  end
end
