require "test_helper"

class FavourittesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favouritte = favourittes(:one)
  end

  test "should get index" do
    get favourittes_url
    assert_response :success
  end

  test "should get new" do
    get new_favouritte_url
    assert_response :success
  end

  test "should create favouritte" do
    assert_difference("Favouritte.count") do
      post favourittes_url, params: { favouritte: {  } }
    end

    assert_redirected_to favouritte_url(Favouritte.last)
  end

  test "should show favouritte" do
    get favouritte_url(@favouritte)
    assert_response :success
  end

  test "should get edit" do
    get edit_favouritte_url(@favouritte)
    assert_response :success
  end

  test "should update favouritte" do
    patch favouritte_url(@favouritte), params: { favouritte: {  } }
    assert_redirected_to favouritte_url(@favouritte)
  end

  test "should destroy favouritte" do
    assert_difference("Favouritte.count", -1) do
      delete favouritte_url(@favouritte)
    end

    assert_redirected_to favourittes_url
  end
end
