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

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: "Test", 
                            foreign_key: "author_id", 
                            dependent: :nullify
  has_many :gists, dependent: :destroy
  has_many :test_passage_badges, through: :test_passages
  has_many :badges, through: :test_passage_badges

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
  
  def passed_tests?(test_ids)
    passed_test_ids = test_passages.where(test_id: test_ids).select(&:success?).map(&:test_id)
    test_ids.uniq.sort == passed_test_ids.uniq.sort
  end
end
