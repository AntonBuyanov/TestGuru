class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :user_passed_tests, dependent: :destroy
  has_many :users, through: :user_passed_tests

  def self.find_test_by_category(name_category)
    joins(:category)
      .where(categories: { title: name_category })
      .order(:title)
      .pluck(:title)
  end
end
