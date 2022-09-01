class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def collection
    @badge = current_user.badges
  end
end
