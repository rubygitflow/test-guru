module QuestionsHelper

  def current_year
    Time.current.year
  end

  def github_url(title, repo_url)
    link_to(title, repo_url, target: "_blank")
  end

  def thinknetica_url
    link_to('Thinknetica', 'https://thinknetica.com', target: "_blank")
  end


end
