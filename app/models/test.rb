class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests
  belongs_to :author, class_name: "User"

  # https://apidock.com/rails/ActiveRecord/Scoping/Named/ClassMethods/scope
  scope :easy,        -> { where(level: 0..1) }
  scope :medium,      -> { where(level: 2..4) }
  scope :hard,        -> { where(level: 5..Float::INFINITY) }
  scope :order_down,  -> { order(title: :desc) }
  scope :by_category, -> (category_title) { 
    joins(:category).where(categories: { title: category_title }) }

  # https://apidock.com/rails/ActiveModel/Validations/ClassMethods/validates
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true }

  # https://apidock.com/rails/ActiveModel/Validations/ClassMethods/validate
  validate :validate_level_positive, on: :create

  def self.test_by_category(category_title)
    # Test.joins(:category)
    #     .where(categories: { title: category_title })
    #     .order("tests.title desc")
    #     .pluck("tests.title")
    by_category(category_title).order_down.pluck(:title)
  end

  private

  def validate_level_positive
    errors.add(:level, 'Use only a positive value') if level.to_i < 0
  end
end
