module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github(user, repo)
    link_to user, "https://github.com/#{user}/#{repo}", target: '_blank'
  end

  def flash_messages
    content_tag :div do
      flash.each do |key, message|
        concat content_tag(:div, message.html_safe, class: "alert alert-#{flash_class(key)}", role: 'notice')
      end
    end
  end

  def flash_class(level)
    case level
    when :notice then "info"
    when :success then "success"
    when :error then "error"
    end
  end
end
