module ApplicationHelper
	def nav_link(text,path)
		page = request.fullpath
		class_name = (("/" + text.downcase) ==  page.downcase ? 'active' : '')

		 content_tag(:li, :class => class_name, :role => 'presentation') do
		 	link_to text,path
		 end

	end
	def print_user
		if user_signed_in?
			 content_tag(:li,  :role => 'presentation') do
		 	link_to "Sign Out", destroy_user_session_path
		end
	else content_tag(:li,  :role => 'presentation') do
		 	link_to "Sign In", new_user_session_path
	end
	end
	end
end