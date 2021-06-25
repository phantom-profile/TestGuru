# frozen_string_literal: true

module ApplicationHelper
  def show_year
    Time.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}/"
  end
end
