class Test < ApplicationRecord
  def self.find_test_by_category(name_category)
    Test.where(categories: { title: name_category }).order(title: :desc).pluck(:title)
  end
end
