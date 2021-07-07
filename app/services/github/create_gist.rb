# frozen_string_literal: true

class Github::CreateGist

  ACCESS_TOKEN = Rails.application.credentials.dig(:github, :token)
  GitHubResponse = Struct.new(:html_url, :url) do
    def success?
      !html_url.nil?
    end
  end

  attr_reader :question, :test, :client

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    response = client.create_gist(gist_params)
    GitHubResponse.new(html_url: response.html_url,
                       url: response.url)
  end

  private

  def gist_params
    { description: I18n.t('gist_sending', test: test.title),
      files: { 'test-guru-question.txt': {
        content: gist_content
      } } }
  end

  def gist_content
    [question.body, *question.answers.pluck(:body)].join("\n")
  end
end
