# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :authenticate_user!, only: :my

  def index
    @badges = Badge.all
  end

  def show
    @badge = Badge.find(params[:id])
  end

  def my
    @badges = current_user.badges
  end
end
