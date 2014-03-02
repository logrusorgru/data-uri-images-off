module ApplicationHelper

	def image_pack image_ary
		result = "<div class=\"image_pack\">"
		image_ary.each{ |i| result += image_tag( image_path( i ) ) }
		result += "</div>"
		result.html_safe
	end

end
