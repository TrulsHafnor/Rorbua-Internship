require "application_system_test_case"

class FavouritesTest < ApplicationSystemTestCase
  setup do
    @favourite = favourites(:one)
  end

  test "visiting the index" do
    visit favourites_url
    assert_selector "h1", text: "Favourites"
  end

  test "should create favourite" do
    visit favourites_url
    click_on "New favourite"

    click_on "Create Favourite"

    assert_text "Favourite was successfully created"
    click_on "Back"
  end

  test "should update Favourite" do
    visit favourite_url(@favourite)
    click_on "Edit this favourite", match: :first

    click_on "Update Favourite"

    assert_text "Favourite was successfully updated"
    click_on "Back"
  end

  test "should destroy Favourite" do
    visit favourite_url(@favourite)
    click_on "Destroy this favourite", match: :first

    assert_text "Favourite was successfully destroyed"
  end
end
