# frozen_string_literal: true

# Tests of different categories with questions and answers
class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: :author_id, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY)}
  scope :titles, -> { order(title: :desc).pluck(:title) }

  def self.by_category(category)
    Category.find_by(title: category).tests.titles
  end
end
