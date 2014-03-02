module ApplicationHelper

  # пачка изображений
  def images
  	images = []
  	(0..9).map{ |i| i }.each do |n|
  		images << "u#{n}.png"
  		images << "p#{n}.png"
  	end
  	images
  end

	def image_pack image_ary
		result = "<div class=\"image_pack\">"
		image_ary.each{ |i| result += image_tag( image_path( i ) ) }
		result += "</div>"
		result.html_safe
	end

end
