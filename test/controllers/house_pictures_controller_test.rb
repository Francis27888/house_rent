require 'test_helper'

class HousePicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @house_picture = house_pictures(:one)
  end

  test "should get index" do
    get house_pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_house_picture_url
    assert_response :success
  end

  test "should create house_picture" do
    assert_difference('HousePicture.count') do
      post house_pictures_url, params: { house_picture: { image: @house_picture.image } }
    end

    assert_redirected_to house_picture_url(HousePicture.last)
  end

  test "should show house_picture" do
    get house_picture_url(@house_picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_house_picture_url(@house_picture)
    assert_response :success
  end

  test "should update house_picture" do
    patch house_picture_url(@house_picture), params: { house_picture: { image: @house_picture.image } }
    assert_redirected_to house_picture_url(@house_picture)
  end

  test "should destroy house_picture" do
    assert_difference('HousePicture.count', -1) do
      delete house_picture_url(@house_picture)
    end

    assert_redirected_to house_pictures_url
  end
end
