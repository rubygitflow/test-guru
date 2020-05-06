class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :authored_tests, class_name: "Test", foreign_key: "author_id"

  # https://apidock.com/rails/ActiveModel/Validations/ClassMethods/validates
  validates :email, presence: true

  def test_by_level(level)
    tests.where(level: level)
  end
end
