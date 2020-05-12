class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }
  
  validates :body, presence: true
  
  # https://apidock.com/rails/ActiveModel/Validations/ClassMethods/validate
  validate :validate_answers_limit, on: :create

  private

  def validate_answers_limit
    if self.question.answers.count > 4
      errors.add(:answers, 'Exceeded the answers limit') 
    end
  end
end
