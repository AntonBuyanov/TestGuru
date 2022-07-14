class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_test, class_name: 'Test', foreign_key: :author_id

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL = URI::MailTo::EMAIL_REGEXP
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL },
            uniqueness: true

  def level_test(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
