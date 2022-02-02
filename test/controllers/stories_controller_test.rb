require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @story = stories(:one)
  end

  test "should get index" do
    get stories_url
    assert_response :success
  end

  test "should get new" do
    get new_story_url
    assert_response :success
  end

  test "should create story" do

    post stories_url, params: {
      story: {
        description: @story.description,
        title: @story.title,
        story_file: fixture_file_upload("one", "audio/mp3")
      }
    }

    assert_redirected_to story_url(Story.last)
  end

  test "should show story" do
    get story_url(@story) # Error her, mulig løsning: https://stackoverflow.com/questions/50453596/activestorage-fixtures-attachments
    assert_response :success
  end

  test "should get edit" do
    get edit_story_url(@story)
    assert_response :success
  end

  test "should update story" do
    patch story_url(@story), params: {
      story: {
        description: @story.description,
        title: @story.title,
        story_file: fixture_file_upload("one", "audio/mp3")
      }
    }
    assert_redirected_to story_url(@story)
  end

  test "should destroy story" do
    assert_difference("Story.count", -1) do
      delete story_url(@story)
    end

    assert_redirected_to stories_url
  end

  test "input fields must not be empty" do
    story = Story.new

    assert story.invalid?
    assert story.errors[:title].any?
    assert story.errors[:description].any?
    assert story.errors[:story_file].any?
  end

end
