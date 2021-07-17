class BadgeRules::AllTestsOfCategory < BadgeRules::BaseBadgeRule
  def achieved?
    user = @test_passage.user
    category = @badge.rule_attribute
    tests_of_category = Test.where(category: category)
    user.tests.of_category(category) == tests_of_category
  end
end
