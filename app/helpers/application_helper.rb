module ApplicationHelper
	def error_messages_for(object)
    render(:partial => 'application/error_messages',
      :locals => {:object => object})
  end
end

module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
end
