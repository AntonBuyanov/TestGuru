class SessionsController < ApplicationController

  include SessionsHelper

  def new; end

  def create
    cookies[:return_to_url] = request.url
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      log_in user
      redirect_to cookies.fetch(:return_path, root_path)
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
