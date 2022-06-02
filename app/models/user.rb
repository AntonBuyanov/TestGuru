class User < ApplicationRecord
  has_many :tests

  def level_test(level)
    tests.where(level: level)
  end
end
