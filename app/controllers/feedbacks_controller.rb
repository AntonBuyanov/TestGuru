class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(resource_params)

    if @feedback.save
      FeedbackMailer.send_message(@feedback).deliver_now
      redirect_to tests_path, notice: 'Форма отправлена'
    else
      render :new
    end
  end

  private

  def resource_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
