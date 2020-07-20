class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  
  def index
    @accommodations = Accommodation.all.paginate(page: params[:page], per_page: 10)
    @search = Search.new
    @search_room = SearchRoom.new
    @reviews = Review.new
    @categories = Category.all
  end


  def show
   @search = Search.new
   @rooms = Room.where(accommodation_id: @accommodation.id).order("created_at DESC")
   @reviews = Review.where(accommodation_id: @accommodation.id).order("created_at DESC")
   @wallpapers = Wallpaper.where(accommodation_id: @accommodation.id).order("created_at DESC")

   if @reviews.blank?
    @avg_review = 0
   else
    @avg_review = @reviews.average(:rating).round(2)
   end
  end

  def new
    if current_user.email != 'onemoox@gmail.com'
      redirect_to root_path
      flash[:notice] = "You are not allowed to add a hotel!"
    end
    @accommodation = current_user.accommodations.build
    @rooms = Room.where(accommodation_id: @accommodation.id).order("created_at DESC")
    @wallpapers = Wallpaper.where(accommodation_id: @accommodation.id).order("created_at DESC")

  end

  def edit
    if  @accommodation.user_id != current_user.id 
            respond_to do |format|
          format.html { redirect_to @accommodation, notice: 'You have no access to this hotel!'}
          format.json { render :show, status: :ok, location: @accommodation }
      end
    end
  end

  
  def create
    @accommodation = current_user.accommodations.build(accommodation_params)
    respond_to do |format|
      if @accommodation.save
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully created.' }
        format.json { render :show, status: :created, location: @accommodation }
      else
        format.html { render :new }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @accommodation.update(accommodation_params)
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully updated.' }
        format.json { render :show, status: :ok, location: @accommodation }
      else
        format.html { render :edit }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @accommodation.destroy
    respond_to do |format|
      format.html { redirect_to accommodations_url, notice: 'Accommodation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_accommodation
      @accommodation = Accommodation.find(params[:id])
    end

    def accommodation_params
      params.require(:accommodation).permit(:name, :maplink, :tel, :email, :description, :category_id, :city_id, wallpapers_attributes: [:id, :_destroy, :name, :image, :accommodation_id ], rooms_attributes: [:id, :_destroy, :title, :room_number,  :price, :description, :accommodation_id, pictures_attributes: [:id, :_destroy, :name, :image, :room_id]])
    end
end
