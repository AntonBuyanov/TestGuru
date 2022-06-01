class User < ApplicationRecord

  def level_test(level)
    Test.where(user_passed_test: { user_id: user_id, level: level})
  end
end
