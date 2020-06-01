module AnswersHelper
  def answer_header(answer)
    # https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-persisted-3F
    if answer.persisted?
      "#{t('.edit')} \"#{answer.body}\""
    else
      t('.create')
    end
  end
end
