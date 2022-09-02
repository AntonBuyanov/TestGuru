class BadgeTestService

  RULES = {
    category: Badges::ByCategoriesRuleSpecification,
    first_attempt: Badges::ByAttemptsRuleSpecification,
    level: Badges::ByLevelRuleSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule.to_sym].new(value: badge.rule_value, test_passage: @test_passage)
      add_badges(badge) if rule.satisfies?
    end
  end

  private

  def add_badges(badges)
    @test_passage.user.badges << badges
  end
end
