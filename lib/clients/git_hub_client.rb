# frozen_string_literal: true

class GitHubClient
  attr_reader :http_client

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = Rails.application.credentials.dig(:github, :token)

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
