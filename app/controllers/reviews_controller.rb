class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_accommodation
  before_action :authenticate_user!

 


  def new 
    if @accommodation.user_id == current_user.id
      respond_to do |format|
          format.html { redirect_to @accommodation, notice: 'You are not allowed to write a review on your own hotel!' }
          format.json { render :show, status: :ok, location: @accommodation }
      end
    else
      @accommodation.reviews.each do |review|
        if review.user_id == current_user.id 
          respond_to do |format|
            format.html { redirect_to @accommodation, notice: 'You already reviewed this hotel!' }
            format.json { render :show, status: :ok, location: @accommodation }
          end
        end
      end
      @review = Review.new
    end
  end


  def edit
  end

   
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.accommodation_id = @accommodation.id


    if @review.save
      redirect_to @accommodation
    else
      render 'new'
    end
  end

 
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def set_accommodation
      @accommodation = Accommodation.find(params[:accommodation_id])
    end

     def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
