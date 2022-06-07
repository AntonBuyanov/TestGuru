class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_passed_tests
  has_many :users, through: :user_passed_tests

  def self.find_test_by_category(name_category)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: name_category })
      .order(:title)
      .pluck(:title)
  end
end
