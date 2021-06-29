# frozen_string_literal: true

module ApplicationHelper
  def show_year
    Date.current.year
  end

  def github_url(title:, author:, repo:)
    link_to title, "https://github.com/#{author}/#{repo}/", target: :_blank
  end

  def link_to_root
    link_to 'To tests', root_path
  end

  def flash_msg(key:, tag:, style:)
    content_tag tag, flash[key], class: style if flash[key]
  end
end
