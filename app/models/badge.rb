# frozen_string_literal: true

class Badge < ApplicationRecord

  RULES = [
    'Completed tests of category',
    'Completed tests of level',
    'Completed test with first attempt'
  ].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates_presence_of :title, :image_link, :rule, :rule_attribute
  validates :rule_attribute, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
