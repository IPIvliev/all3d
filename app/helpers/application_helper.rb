module ApplicationHelper

	def active_page1(active_page)
		@active == active_page ? "active" : ""
	end

	def active_page(href)
	  	"active" if current_page?(href)
	end  

end