module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github(user, repo)
    link_to user, "https://github.com/#{user}/#{repo}", target: '_blank'
  end
end
