require 'test_helper'

class ImageRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_room = image_rooms(:one)
  end

  test "should get index" do
    get image_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_image_room_url
    assert_response :success
  end

  test "should create image_room" do
    assert_difference('ImageRoom.count') do
      post image_rooms_url, params: { image_room: { name: @image_room.name, room_id: @image_room.room_id } }
    end

    assert_redirected_to image_room_url(ImageRoom.last)
  end

  test "should show image_room" do
    get image_room_url(@image_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_room_url(@image_room)
    assert_response :success
  end

  test "should update image_room" do
    patch image_room_url(@image_room), params: { image_room: { name: @image_room.name, room_id: @image_room.room_id } }
    assert_redirected_to image_room_url(@image_room)
  end

  test "should destroy image_room" do
    assert_difference('ImageRoom.count', -1) do
      delete image_room_url(@image_room)
    end

    assert_redirected_to image_rooms_url
  end
end
