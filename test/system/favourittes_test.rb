require "application_system_test_case"

class FavourittesTest < ApplicationSystemTestCase
  setup do
    @favouritte = favourittes(:one)
  end

  test "visiting the index" do
    visit favourittes_url
    assert_selector "h1", text: "Favourittes"
  end

  test "should create favouritte" do
    visit favourittes_url
    click_on "New favouritte"

    click_on "Create Favouritte"

    assert_text "Favouritte was successfully created"
    click_on "Back"
  end

  test "should update Favouritte" do
    visit favouritte_url(@favouritte)
    click_on "Edit this favouritte", match: :first

    click_on "Update Favouritte"

    assert_text "Favouritte was successfully updated"
    click_on "Back"
  end

  test "should destroy Favouritte" do
    visit favouritte_url(@favouritte)
    click_on "Destroy this favouritte", match: :first

    assert_text "Favouritte was successfully destroyed"
  end
end
