class User < ApplicationRecord

  def level_test(level)
    Test.joins('JOIN user_passed_tests ON tests.id = user_passed_tests.test_id')
        .where(user_passed_tests: { user_id: :id }, tests: { level: level })
  end
end
