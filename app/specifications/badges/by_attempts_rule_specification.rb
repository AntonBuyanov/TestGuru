module Badges
  class ByAttemptsRuleSpecification < AbstractRuleSpecifications
    def satisfies?
      @test_passage.user.tests.passed_test.where(id: @test_passage.test.id).count == @value.to_i
    end
  end
end

