class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  SUCCESS_RATE = 85

  def completed?
    current_question.nil? || time_out?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids) && time_alive?
      self.correct_questions += 1
      self.success_percent = result
    end

    save!
  end

  def success?
    result >= SUCCESS_RATE
  end

  def time_out?
    test.timer? && timer_finish.past?
  end

  def time_alive?
    !time_out?
  end

  def result
    ((self.correct_questions).to_f / (question_count) * 100).round
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def question_count
    test.questions.count
  end

  def timer_finish
    created_at + test.timer.minutes
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def next_question
    if test.present? && current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
