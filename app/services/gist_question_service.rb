# frozen_string_literal: true

class GistQuestionService

  ACCESS_TOKEN = Rails.application.credentials.dig(:github, :token)

  attr_reader :question, :test, :client

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    client.post('gists', gist_params.to_json)
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
