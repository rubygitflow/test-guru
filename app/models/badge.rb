class Badge < ApplicationRecord
  has_many :test_passage_badges, dependent: :delete_all
  has_many :test_passages, through: :test_passage_badges
  has_many :tests, through: :test_passages
  has_many :users, through: :test_passages

  validates :title, :rule, :image, presence: true
  validates :title, uniqueness: true


  module Rule
    FIRST_ATTEMPT = 0
    LEVEL = 1
    CATEGORY = 2

    DEF_IMAGE_FIRST_ATTEMPT = 
      'https://image.flaticon.com/icons/png/128/1579/1579491.png'.freeze
    DEF_IMAGE_LEVEL = 
      'https://image.flaticon.com/icons/png/128/1579/1579489.png'.freeze
    DEF_IMAGE_CATEGORY = 
      'https://image.flaticon.com/icons/png/128/1579/1579490.png'.freeze

    ALL = [FIRST_ATTEMPT, LEVEL, CATEGORY].freeze

    LABEL_BY_CODE = {
      FIRST_ATTEMPT => I18n.t('models.badge.rule.badge_label_of_first_attempt'),
      LEVEL => I18n.t('models.badge.rule.badge_label_of_level'),
      CATEGORY => I18n.t('models.badge.rule.badge_label_of_category')
    }.freeze

    NAME_BY_CODE = {
      FIRST_ATTEMPT => :first_attempt_rule,
      LEVEL => :level_rule,
      CATEGORY => :category_rule
    }.freeze

    def self.all
      ALL.collect { |i| OpenStruct.new(id: i, label: LABEL_BY_CODE[i]) }
    end
  end

  def rule_label
    Rule::LABEL_BY_CODE.fetch(rule, '')
  end

  def rule_name
    Rule::NAME_BY_CODE.fetch(rule)
  end
end
