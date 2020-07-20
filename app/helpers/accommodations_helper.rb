module AccommodationsHelper
	def googlemap_frame(url)
		content_tag(:iframe, '', src: url, width: 600, height: 450, frameborder: 0)
	end
end
