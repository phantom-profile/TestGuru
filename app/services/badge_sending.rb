# frozen_string_literal: true

class BadgeSending
  def self.call(test_passage)
    new(test_passage).call
  end

  def initialize(test_passage)
    @user = test_passage.user
    @test_passage = test_passage
  end

  def call
    puts(Badge::RULES.inspect)
    Badge.find_each do |badge|
      if Badge::RULES[badge.rule.to_sym].achieved?(@test_passage, badge)
        UserBadge.create(badge: badge, user: @user)
        @message = "#{badge.title} achieved"
      end
    end
  end
end
