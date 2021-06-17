# frozen_string_literal: true

# Tests of different categories with questions and answers
class Test < ApplicationRecord

  def self.tests_by_category(title)
    category = Category.find_by(title: title)
    Test.where(category_id: category.id).pluck(:title)
  end
end
