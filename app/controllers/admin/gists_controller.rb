class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.created_at_by_desc
  end

  def show
    @gist = Gist.find(params[:id])
  end
end
