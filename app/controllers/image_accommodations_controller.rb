class ImageAccommodationsController < ApplicationController
  before_action :set_image_accommodation, only: [:show, :edit, :update, :destroy]
  before_action :set_accommodation




  def new
    @image_accommodation = ImageAccommodation.new
  end

  def edit
  end


  def create
    @image_accommodation = ImageAccommodation.new(image_accommodation_params)
    @image_accommodation.accommodation_id = @accommodation.id

       if @image_accommodation.save
        redirect_to @accommodation
      else
        render 'new'
      end
  end


  def update
    respond_to do |format|
      if @image_accommodation.update(image_accommodation_params)
        format.html { redirect_to @image_accommodation, notice: 'Image accommodation was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_accommodation }
      else
        format.html { render :edit }
        format.json { render json: @image_accommodation.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @image_accommodation.destroy
    respond_to do |format|
      format.html { redirect_to image_accommodations_url, notice: 'Image accommodation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_image_accommodation
      @image_accommodation = ImageAccommodation.find(params[:id])
    end

    def set_accommodation
      @accommodation = Accommodation.find(params[:accommodation_id])
    end

    def image_accommodation_params
      params.require(:image_accommodation).permit(:name, :image, :accommodation_id)
    end
end
