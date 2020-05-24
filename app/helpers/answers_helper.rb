module AnswersHelper
  def answer_header(answer)
    # https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-persisted-3F
    if answer.persisted?
      "Edit Answer: \"#{answer.body}\""
    else
      "Create New Answer"
    end
  end
end
