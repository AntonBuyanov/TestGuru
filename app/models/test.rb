class Test < ApplicationRecord

  def self.find_test_by_category(name_category)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: name_category })
      .order(:title)
      .pluck(:title)
  end
end
