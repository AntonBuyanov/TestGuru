class GistsController < ApplicationController

  before_action :find_test_passage, only: :create

  def create
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      current_user.gists.create(question: @test_passage.current_question, url: result.gist_url)

      flash_options = { notice: t('.success', url_html: helpers.link_to(result.gist_url, result.gist_url, target: '_blank').html_safe) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
