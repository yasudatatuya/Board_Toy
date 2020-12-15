require 'test_helper'

class GameCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get game_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get game_comments_create_url
    assert_response :success
  end

  test "should get show" do
    get game_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get game_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get game_comments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get game_comments_destroy_url
    assert_response :success
  end

end
