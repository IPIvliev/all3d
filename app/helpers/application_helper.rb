module ApplicationHelper

	def active_page1(active_page)
		@active == active_page ? "active" : ""
	end

	def active_page(href)
	  	"active" if current_page?(href)
	end  

	def user_name_with_mail(user)
		href = link_to "<i class='fa fa-envelope-o'></i>".html_safe, new_conversation_path(:user => user)
		if user_signed_in? && current_user != user
			"#{user.name} #{href}".html_safe
		else
			"#{user.name}"
		end	
	end
end