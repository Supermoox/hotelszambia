require 'test_helper'

class ImageAccommodationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_accommodation = image_accommodations(:one)
  end

  test "should get index" do
    get image_accommodations_url
    assert_response :success
  end

  test "should get new" do
    get new_image_accommodation_url
    assert_response :success
  end

  test "should create image_accommodation" do
    assert_difference('ImageAccommodation.count') do
      post image_accommodations_url, params: { image_accommodation: { accommodation_id: @image_accommodation.accommodation_id, name: @image_accommodation.name } }
    end

    assert_redirected_to image_accommodation_url(ImageAccommodation.last)
  end

  test "should show image_accommodation" do
    get image_accommodation_url(@image_accommodation)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_accommodation_url(@image_accommodation)
    assert_response :success
  end

  test "should update image_accommodation" do
    patch image_accommodation_url(@image_accommodation), params: { image_accommodation: { accommodation_id: @image_accommodation.accommodation_id, name: @image_accommodation.name } }
    assert_redirected_to image_accommodation_url(@image_accommodation)
  end

  test "should destroy image_accommodation" do
    assert_difference('ImageAccommodation.count', -1) do
      delete image_accommodation_url(@image_accommodation)
    end

    assert_redirected_to image_accommodations_url
  end
end
