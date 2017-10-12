module ProjectsHelper
	def row_color(status)
		if status == true
			return "success"
		else
			return "warning"
		end
	end

	def project_status(status)
		if status == true
			return "Опубликован"
		else
			return "Не опубликован"
		end
	end
end
