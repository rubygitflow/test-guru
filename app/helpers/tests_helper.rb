module TestsHelper
  def test_header(test)
    # https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-persisted-3F
    if test.persisted?
      "Edit Test: \"#{test.title}\""
    else
      "Create New Test"
    end
  end
end
