# frozen_string_literal: true

# Tests of different categories with questions and answers
class Test < ApplicationRecord
  has_many :questions
  has_and_belongs_to_many :users

  belongs_to :category
  belongs_to :author, foreign_key: :author_id, class_name: 'User'

  def self.by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
