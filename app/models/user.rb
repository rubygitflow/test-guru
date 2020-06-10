class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable,
          :validatable,
          :confirmable


  EMAIL_VALIDATION = /.+@.+\..+/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: "Test", foreign_key: "author_id"
  has_many :gists

  validates :name, :email, presence: true
  validates :email, uniqueness: true, 
                    format: { with: EMAIL_VALIDATION, 
                              message: "Invalid email format" }

  # has_secure_password # replaced include Auth

  def test_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
