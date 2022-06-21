class QuestionsController < ApplicationController

  before_action :find_question, only: :show
  before_action :find_test, except: :show

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    result = @test.questions.pluck(:body)

    render plain: result.join("\n")
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render plain: 'Question create'
    else
      render :new
    end
  end

  def destroy
    @question.destroy

    render plain: 'Question deleted'
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
