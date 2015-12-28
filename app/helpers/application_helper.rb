module ApplicationHelper
	def nav_link(text,path)
		page = request.fullpath
		class_name = (("/" + text.downcase) ==  page.downcase ? 'active' : '')

		 content_tag(:li, :class => class_name, :role => 'presentation') do
		 	link_to text,path
		 end

	end
end