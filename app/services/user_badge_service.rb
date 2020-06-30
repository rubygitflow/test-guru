class UserBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    assign_badges
  end

  private
    
  def assign_badges
    badges = Badge.all
    badges.each do |badge|
      send(badge.rule_name, badge)
    end
    badges.each do |badge|
      users.badges << badge if send("#{badge.rule_name}_award?", 
                                    badge.value.to_i)
    end
  end

  def category_rule_award?(value)
    return false if value != @test.category_id

    test_ids = Test.with_questions.where(category_id: value).pluck(:id)
    @user.passed_tests?(test_ids)
  end

  def first_attempt_rule_award?(value)
    control_count = 
      TestPassage.where(user_id: @user.id, test_id: @test.id).count
    rcontrol_count == 1
  end

  def level_rule_award?(value)
    return false if value != @test.level

    test_ids = Test.with_questions.where(level: value).pluck(:id)
    @user.passed_tests?(test_ids)
  end
end
