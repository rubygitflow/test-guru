class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question',
                                foreign_key: 'current_question_id', 
                                optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  GOOD_PROGRESS = 85

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def get_completed_percent
    (correct_question.to_f / test.questions.size * 100).round(2)
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)
    self.save!
  end

  def accept!(answer_ids)
    self.correct_question += 1 if correct_answer?(answer_ids)
    self.save!
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def before_update_set_next_question
    self.current_question = next_question
  end


  def correct_answer?(answer_ids)
    answer_ids ||= []
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end


  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
