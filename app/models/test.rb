# frozen_string_literal: true

# Tests of different categories with questions and answers
class Test < ApplicationRecord

  def self.tests_by_category(title)
    Category.joins('INNER JOIN tests ON tests.category_id = categories.id')
            .where(title: title)
            .pluck('tests.title')
  end
end
