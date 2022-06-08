class User < ApplicationRecord
  has_many :user_passed_tests, dependent: :destroy
  has_many :tests, through: :user_passed_tests

  def level_test(level)
    tests.where(level: level)
  end
end
