module TestPassagesHelper
  def success?(completed_percent)
    completed_percent >= TestPassage::GOOD_PROGRESS
  end
end
