class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answer_limit

  scope :correct_answer, -> { where(correct: true) }

  private

  def answer_limit
    errors.add(:answer_limit) if question.answers.count >= 4
  end
end
