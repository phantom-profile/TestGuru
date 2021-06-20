# frozen_string_literal: true

# Tests of different categories with questions and answers
class Test < ApplicationRecord
  def self.by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
