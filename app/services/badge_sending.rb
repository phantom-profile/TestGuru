# frozen_string_literal: true

class BadgeSending

  RULES = {
    'Completed tests of category': BadgeRules::AllTestsOfCategory,
    'Completed tests of level': BadgeRules::AllTestsOfLevel,
    'Completed test with first attempt': BadgeRules::TestWithFirstAttempt
  }.freeze

  def self.call(test_passage)
    new(test_passage).call
  end

  def initialize(test_passage)
    @user = test_passage.user
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      @user.badges.push(badge) if RULES[badge.rule.to_sym].achieved?(@test_passage, badge)
    end
  end
end
