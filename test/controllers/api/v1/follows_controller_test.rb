require "test_helper"

class Api::V1::FollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_follows_create_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_follows_destroy_url
    assert_response :success
  end
end
