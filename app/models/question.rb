class Question < ApplicationRecord
  belongs_to :test
  # http://rusrails.ru/active-record-associations#dependent
  # https://guides.rubyonrails.org/association_basics.html
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :passed_tests, class_name: "TestPassage",
                          foreign_key: 'current_question_id', 
                          dependent: :nullify
  
  validates :body, presence: true
end
