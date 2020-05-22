module QuestionsHelper
  def question_header(question)
    # https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-persisted-3F
    if question.persisted?
      "Edit Question: \"#{question.body}\""
    else
      "Create New Question"
    end
  end
end
