class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answer_limit, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def answer_limit
    errors.add(:answer_limit) if question.answers.count >= 4
  end
end
