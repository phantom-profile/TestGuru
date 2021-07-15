# frozen_string_literal: true

class Badge < ApplicationRecord
  has_one :rule, class_name: 'Rule', dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  def achieved_by?(user)
    # if achievement can be got only once (complete all tests of...) it stops action
    return false if unique && already_got?(user)

    rule.completed_by?(user)
  end

  private

  def already_got?(user)
    users.include?(user)
  end
end
