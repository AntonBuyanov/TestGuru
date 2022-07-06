class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_test, class_name: 'Test'

  validates :email, presence: true

  def level_test(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
