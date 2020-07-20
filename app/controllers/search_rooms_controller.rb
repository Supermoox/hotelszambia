class SearchRoomsController < ApplicationController
  def new
    @search_room = SearchRoom.new
    @accommodations = Accommodation.all
  end

  def create 
    @search_room = SearchRoom.create!(search_room_params)

    redirect_to @search_room
  end

  def show
    @search_room = SearchRoom.find(params[:id])

  end

  def update
  end
  
  private
    def search_room_params
      params.require(:search_room).permit(:price, :category_id, :city_id, :min_price, :max_price)
    end
end
