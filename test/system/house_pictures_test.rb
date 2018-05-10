require "application_system_test_case"

class HousePicturesTest < ApplicationSystemTestCase
  setup do
    @house_picture = house_pictures(:one)
  end

  test "visiting the index" do
    visit house_pictures_url
    assert_selector "h1", text: "House Pictures"
  end

  test "creating a House picture" do
    visit house_pictures_url
    click_on "New House Picture"

    fill_in "Image", with: @house_picture.image
    click_on "Create House picture"

    assert_text "House picture was successfully created"
    click_on "Back"
  end

  test "updating a House picture" do
    visit house_pictures_url
    click_on "Edit", match: :first

    fill_in "Image", with: @house_picture.image
    click_on "Update House picture"

    assert_text "House picture was successfully updated"
    click_on "Back"
  end

  test "destroying a House picture" do
    visit house_pictures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "House picture was successfully destroyed"
  end
end
