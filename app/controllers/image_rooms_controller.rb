class ImageRoomsController < ApplicationController
  before_action :set_image_room, only: [:show, :edit, :update, :destroy]

  # GET /image_rooms
  # GET /image_rooms.json
  def index
    @image_rooms = ImageRoom.all
  end

  # GET /image_rooms/1
  # GET /image_rooms/1.json
  def show
  end

  # GET /image_rooms/new
  def new
    @image_room = ImageRoom.new
  end

  # GET /image_rooms/1/edit
  def edit
  end

  # POST /image_rooms
  # POST /image_rooms.json
  def create
    @image_room = ImageRoom.new(image_room_params)

    respond_to do |format|
      if @image_room.save
        format.html { redirect_to @image_room, notice: 'Image room was successfully created.' }
        format.json { render :show, status: :created, location: @image_room }
      else
        format.html { render :new }
        format.json { render json: @image_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_rooms/1
  # PATCH/PUT /image_rooms/1.json
  def update
    respond_to do |format|
      if @image_room.update(image_room_params)
        format.html { redirect_to @image_room, notice: 'Image room was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_room }
      else
        format.html { render :edit }
        format.json { render json: @image_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_rooms/1
  # DELETE /image_rooms/1.json
  def destroy
    @image_room.destroy
    respond_to do |format|
      format.html { redirect_to image_rooms_url, notice: 'Image room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_room
      @image_room = ImageRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_room_params
      params.require(:image_room).permit(:name, :room_id)
    end
end
