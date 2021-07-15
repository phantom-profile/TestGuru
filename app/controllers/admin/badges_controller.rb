# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :badge, only: %i[show edit destroy update]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @rule_types = Rule::TYPES
    @badge = Badge.new
  end

  def create
    valid_params = badge_params
    rule = valid_params.delete(:rule_type)
    @badge = Badge.create(valid_params)
    if @badge.save
      redirect_to new_admin_badge_rule_path(badge_id: @badge, rule_type: rule)
    else
      render :new
    end
  end

  def edit
    @rule_types = Rule::TYPES
  end

  def update

    valid_params = badge_params
    rule = valid_params.delete(:rule_type)
    if @badge.update(valid_params)
      redirect_to new_admin_badge_rule_path(@badge, rule_type: rule)
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
    params.require(:badge).permit(:title, :unique, :rule_type)
  end
end

