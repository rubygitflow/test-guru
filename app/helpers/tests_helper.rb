module TestsHelper
  def test_header(test)
    if question.present?
      # https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-persisted-3F
      if test.persisted?
        "Edit \"#{test.title}\" Test"
      else
        "Create New \"#{test.title}\" Test"
      end
    end
  end
end
