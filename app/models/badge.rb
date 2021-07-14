# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  def achieved_by?(user)
    # if achievement can be got only once (complete all tests of...) it stops action
    return false if unique && already_got?(user)

    case rule
    when 1
      # if rule is category, it compares if all tests of category are in user's tests
      tests_of_category = Test.where(category: rule_attribute)
      user.tests & tests_of_category == tests_of_category
    when 2
      # if rule is level, it compares if all tests of level are in user's tests
      tests_of_level = Test.where(level: rule_attribute)
      user.tests & tests_of_level == tests_of_level
    when 3
      # if rule is first, it compares is there only one test_passage
      TestPassage.where(user: user, test: rule_attribute).size == 1
    end
  end

  private

  def already_got?(user)
    users.include?(user)
  end
end
