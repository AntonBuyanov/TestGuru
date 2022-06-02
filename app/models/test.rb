class Test < ApplicationRecord
  belongs_to :category

  def self.find_test_by_category(name_category)
    joins(:category)
      .where(categories: { title: name_category })
  end
end
