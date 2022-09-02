module Badges
  class ByCategoriesRuleSpecification < AbstractRuleSpecifications
    def satisfies?
      category = @value
      return false if category != @test_passage.test.category.title

      @test_passage.user.tests.passed_test.by_category(category).uniq.count == Test.all.by_category(category).uniq.count
    end
  end
end
