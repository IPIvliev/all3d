module UsersHelper

	def comment_color(comment)
		if comment.model.present?
			return "dark"
		else
			return "primary"
		end
	end

	def timeline_color(item)
		if item.model.present?
			return "warning"
		else
			return "primary"
		end
	end




  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "desc") ? "asc" : "desc"
    icon = (column == sort_column && sort_direction == "desc") ? "up" : "down"

    if column == sort_column
	    link_to users_path(sort: column, :direction => direction, :search => params[:search]) do
	      "#{title} &nbsp; <i class='fa fa-arrow-#{icon}'></i>".html_safe
	    end
	else
		link_to title, {:sort => column, :direction => direction, :search => params[:search]}
	end

  end  
end

