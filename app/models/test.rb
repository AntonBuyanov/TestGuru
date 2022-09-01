class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }

  scope :passed_test, -> { includes(:test_passages).where('success_percent >= ?', TestPassage::SUCCESS_RATE) }
  scope :by_category, ->(category) { joins(:category).where('categories.title = ?', category) }
  scope :by_level, ->(level) { where('level = ?', level) }

  validates :title, presence: true,
            uniqueness: { scope: :level,
                          message: 'title and level must be unique'}
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.find_test_by_category(name_category)
    joins(:category)
      .where(categories: { title: name_category })
      .order(:title)
      .pluck(:title)
  end
end
