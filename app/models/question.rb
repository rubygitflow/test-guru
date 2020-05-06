class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answers_limit, on: :create

  private

  def validate_answers_limit
    if question.answers.count > 4
      errors.add(:answers, 'Exceeded the answers limit') 
    end
  end
end
