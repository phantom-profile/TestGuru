# frozen_string_literal: true

class Badge < ApplicationRecord

  RULES = {
    'Completed tests of category': BadgeRules::AllTestsOfCategory,
    'Completed tests of level': BadgeRules::AllTestsOfLevel,
    'Completed test with first attempt': BadgeRules::TestWithFirstAttempt
  }.freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
end
