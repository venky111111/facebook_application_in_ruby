require "test_helper"

class PostcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postcomments_index_url
    assert_response :success
  end

  test "should get show" do
    get postcomments_show_url
    assert_response :success
  end

  test "should get new" do
    get postcomments_new_url
    assert_response :success
  end

  test "should get create" do
    get postcomments_create_url
    assert_response :success
  end
end
