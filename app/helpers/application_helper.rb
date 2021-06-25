# frozen_string_literal: true

module ApplicationHelper
  def show_year
    Date.current.year
  end

  def github_url(title:, author:, repo:)
    link_to title, "https://github.com/#{author}/#{repo}/"
  end
end
