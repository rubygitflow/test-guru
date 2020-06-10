class GistQuestionService
  # We are using dependency injection on a "client"
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: GitHubClient::ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    [200, 201].include?(@client.last_response.status)
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end