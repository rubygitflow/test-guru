module QuestionsHelper
  def question_header(question)
    if question.present?
      # https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-persisted-3F
      if question.persisted?
        "Edit \"#{question.test.title}\" Question"
      else
        "Create New \"#{question.test.title}\" Question"
      end
    end
  end
end
