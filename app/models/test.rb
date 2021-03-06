# frozen_string_literal: true

# Tests of different categories with questions and answers
class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, foreign_key: :author_id, class_name: 'User', optional: true

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :time, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :of_category, ->(id) { where(category: id) }
  scope :of_level, ->(level) { where(level: level) }

  def self.by_category(category)
    joins(:category)
      .where(category: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
