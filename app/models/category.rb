class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  # https://apidock.com/rails/ActiveRecord/Base/default_scope/class
  default_scope { order(title: :asc) }
end
