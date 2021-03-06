# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :badge, only: %i[show edit destroy update]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @rule_types = []
    Badge::RULES.each do |rule|
      @rule_types << [rule, rule]
    end
    @badge = Badge.new
  end

  def create
    @badge = Badge.create(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit
    @rule_types = []
    Badge::RULES.each do |rule|
      @rule_types << [rule, rule]
    end
  end

  def update
    @badge = Badge.update(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :unique, :rule, :rule_attribute)
  end
end

