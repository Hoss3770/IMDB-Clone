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
			a = nav_link("User",user_path(current_user.id))
			b = content_tag(:li,  :role => 'presentation') do
		 		link_to "Sign Out", destroy_user_session_path
			end
			return [a,b].join
		elsif admin_signed_in?
		 		a = nav_link('Users',users_path)

		 		b = content_tag(:li,  :role => 'presentation') do
		 			link_to "Sign Out(Admin)", destroy_admin_session_path
		 		end
		 		return [a,b].join

		 else
		 	content_tag(:li,  :role => 'presentation') do
		 		link_to "Sign in", new_user_session_path
		 	end
		end
	end

	def resource_name
    	:user
  	end

  	def resource
   	 	@resource ||= User.new
 	end

  	def devise_mapping
    	@devise_mapping ||= Devise.mappings[:user]
  	end
  	
end