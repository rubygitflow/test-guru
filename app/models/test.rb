class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: "User"

  def self.test_by_category(category_title)
    Test.joins(:category)
        .where(categories: { title: category_title })
        .order("tests.title desc")
        .pluck("tests.title")
  end
end
