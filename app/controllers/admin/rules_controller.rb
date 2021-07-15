class Admin::RulesController < Admin::BaseController
  before_action :badge

  def new
    @rule = Rule.new
    @type = params[:rule_type]
    puts(@type)
    case @type
    when '1'
      @label = 'Category'
      @field = 'select'
      @rule_attribute = [Category.all, :title]
    when '2'
      @label = 'Level'
      @field = 'numeric'
    when '3'
      @label = 'Test'
      @field = 'select'
      @rule_attribute = [Test.all, :title]
    end
  end

  def create
    @rule = Rule.create(rule_params)
    @rule.badge = @badge
    if @rule.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  private

  def badge
    @badge = Badge.find(params[:badge_id])
  end

  def rule_params
    params.require(:rule).permit(:rule_attribute, :rule_type)
  end
end
