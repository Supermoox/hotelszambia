class Search < ApplicationRecord

	def find_accommodations

			accommodations = Accommodation.all
			accommodations = accommodations.where("name LIKE ?", "%#{keywords}%") if keywords.present?
			accommodations = accommodations.where(category_id: category_id) if category_id.present?
			accommodations = accommodations.where(city_id: city_id) if city_id.present?
			
		return accommodations
	end


end
