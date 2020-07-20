class SearchRoom < ApplicationRecord

	def find_rooms

			rooms = Room.all
			rooms = rooms.where("price >= ?", min_price) if min_price.present?
			rooms = rooms.where("price <= ?", max_price) if max_price.present?
			rooms = rooms.where("price = ?", price) if price.present?
			
		return rooms
	end

end
