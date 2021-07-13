# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :badge, only: %i[show edit destroy update]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create; end

  def edit; end

  def update; end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

    private

  def badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :unique)
  end
end
