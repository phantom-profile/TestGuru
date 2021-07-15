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

  def create
    @badge = Badge.create(badge_params)
    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
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
    valid_params = params.require(:badge).permit(:title, :level, :test_id, :category_id, :unique, :rule)
    rule = valid_params[:rule]
    # depended on what rule was chosen all unnecessary params are removed and needed one is renamed
    case rule
    when '1'
      valid_params.delete(:level)
      valid_params.delete(:test_id)
      valid_params[:rule_attribute] = valid_params[:category_id]
      valid_params.delete(:category_id)
    when '2'
      valid_params.delete(:category_id)
      valid_params.delete(:test_id)
      valid_params[:rule_attribute] = valid_params[:level]
      valid_params.delete(:level)
    when '3'
      valid_params.delete(:level)
      valid_params.delete(:category_id)
      valid_params[:rule_attribute] = valid_params[:test_id]
      valid_params.delete(:test_id)
    end
    valid_params
  end
end
