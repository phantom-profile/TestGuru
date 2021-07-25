class BadgeRules::AllTestsOfLevel < BadgeRules::BaseBadgeRule
  def achieved?
    user = @test_passage.user
    level = @badge.rule_attribute
    tests_of_level = Test.where(level: level)
    user.tests.of_level(level) == tests_of_level
  end
end
