# frozen_string_literal: true

class UserBadgesController < ApplicationController
  before_action :authenticate_user!

  def create
    @badges = Badge.all
    # for each badge check if user completed rule for it
    @badges.each do |badge|
      if badge.achieved_by?(current_user)
        UserBadge.create(user: current_user, badge: badge)
        flash[:notice] = "#{badge.title} achieved"
      end
    end
    redirect_to root_path
  end
end
