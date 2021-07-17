class BadgeRules::AllTestsOfLevel < BadgeRules::BaseBadgeRule
  def call
    user = @test_passage.user
    level = @badge.rule_attribute
    tests_of_level = Test.where(level: level)
    user.tests & tests_of_level == tests_of_level
  end
end
