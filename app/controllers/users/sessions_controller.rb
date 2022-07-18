class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = t('.signed_in', name: current_user.name)
  end
end
