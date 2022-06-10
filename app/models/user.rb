class User < ApplicationRecord
  has_many :user_passed_tests, dependent: :destroy
  has_many :tests, through: :user_passed_tests
  has_many :author_test, class_name: 'Test'

  validates :email, presence: true

  def level_test(level)
    tests.where(level: level)
  end
end
