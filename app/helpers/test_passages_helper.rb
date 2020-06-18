module TestPassagesHelper
  def success?(completed_percent)
    completed_percent >= TestPassage::GOOD_PROGRESS
  end
  
  def progress_bar_width(test_passage)
    test_passage.current_question_number.to_f / test_passage.test.questions.size * 100
  end
end
