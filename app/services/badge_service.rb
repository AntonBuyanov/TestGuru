class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      case badge.rule
      when 'category'
        merit(badge) if pass_by_category?(badge.rule_value)
      when 'first_attempt'
        merit(badge) if pass_by_first_attempt?(badge.rule_value.to_i)
      when 'level'
        merit(badge) if pass_by_level?(badge.rule_value.to_i)
      end
    end
  end

  private

  def merit(badge)
    @user.badges << badge
  end

  def pass_by_category?(category)
    return false if category != @test_passage.test.category.title

    @user.tests.passed_test.by_category(category).uniq.count == Test.all.by_category(category).uniq.count
  end

  def pass_by_first_attempt?(attempts)
    @user.tests.passed_test.where(id: @test_passage.test.id).count == attempts
  end

  def pass_by_level?(level)
    return false if level != @test_passage.test.level

    @user.tests.passed_test.by_level(level).uniq.count == Test.all.by_level(level).uniq.count
  end
end
