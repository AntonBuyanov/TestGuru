class AbstractRuleSpecifications
  def initialize(value:, test_passage:)
    @value = value
    @test_passage = test_passage
  end

  def satisfies?; end
end
