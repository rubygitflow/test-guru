module TestsHelper
  def test_header(test)
    # https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-persisted-3F
    if test.persisted?
      "#{t('.edit')} \"#{test.title}\""
    else
      t('.create')
    end
  end
end
