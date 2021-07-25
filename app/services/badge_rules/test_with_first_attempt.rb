class BadgeRules::TestWithFirstAttempt < BadgeRules::BaseBadgeRule
  def achieved?
    user = @test_passage.user
    test = @badge.rule_attribute
    TestPassage.where(user: user, test: test).size == 1
  end
end
