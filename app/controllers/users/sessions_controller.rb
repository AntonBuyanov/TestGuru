class Users::SessionsController < Devise::SessionsController
  after_action :custom_welcome, only: %i[create]

  def custom_welcome
    flash.notice = "Welcome #{current_user.name}." if flash.key?(:notice)
  end
end
