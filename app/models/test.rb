class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
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
  # http://rusrails.ru/active-record-validations
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  def self.test_by_category(category_title)
    by_category(category_title).order_down.pluck(:title)
  end
end
