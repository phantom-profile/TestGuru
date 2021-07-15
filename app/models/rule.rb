# frozen_string_literal: true

class Rule < ApplicationRecord
  TYPES = [
    ['Category', 1],
    ['Level', 2],
    ['Completed with first attempt', 3]
  ].freeze

  belongs_to :badge

  # теперь систему легче масштабировать. Достаточно добавить нужный if блок в эту функцию, строку в TYPES и
  # в action RulesController#new, изменять существующий код не нужно
  def completed_by?(user)
    @user = user
    case rule_type
    when 1
      completed_category?
    when 2
      completed_level?
    when 3
      first_attempt?
    end
  end

  private

  def completed_category?
    tests_of_category = Test.where(category: rule_attribute)
    @user.tests & tests_of_category == tests_of_category
  end

  def completed_level?
    tests_of_level = Test.where(level: rule_attribute)
    @user.tests & tests_of_level == tests_of_level
  end

  def first_attempt?
    TestPassage.where(user: @user, test: rule_attribute).size == 1
  end
end
