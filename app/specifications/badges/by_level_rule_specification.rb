module Badges
  class ByLevelRuleSpecification < AbstractRuleSpecifications
    def satisfies?
      level = @value.to_i
      return false if level != @test_passage.test.level

      @test_passage.user.tests.passed_test.by_level(level).uniq.count == Test.all.by_level(level).uniq.count
    end
  end
end
