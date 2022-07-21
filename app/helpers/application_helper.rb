module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github(user, repo)
    link_to user, "https://github.com/#{user}/#{repo}", target: '_blank'
  end

  def flash_class(level)
    case level
    when :notice then "alert-info"
    when :success then "alert-success"
    when :error then "alert-error"
    end
  end
end
