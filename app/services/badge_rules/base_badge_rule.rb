class BadgeRules::BaseBadgeRule

  def self.achieved?(test_passage, badge)
    return false if badge.unique && badge.users.include?(test_passage.user)

    new(test_passage, badge).achieved?
  end

  def initialize(test_passage, badge)
    @test_passage = test_passage
    @badge = badge
  end

  def achieved?; end
end
