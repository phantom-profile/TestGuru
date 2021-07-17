class BadgeRules::AllTestsOfCategory < BadgeRules::BaseBadgeRule
  def call
    user = @test_passage.user
    category = @badge.rule_attribute
    tests_of_category = Test.where(category: category)
    user.tests & tests_of_category == tests_of_category
  end
end
