module QuestionsHelper
  def question_header(question)
    # https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-persisted-3F
    if question.persisted?
      "#{t('.edit')} \"#{question.body}\""
    else
      t('.create')
    end
  end
end
