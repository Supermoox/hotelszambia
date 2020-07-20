module ApplicationHelper
	def googlemap_frame(url)
		content_tag(:iframe, '', src: url, width: 600, height: 300, frameborder: 0)
	end
end
