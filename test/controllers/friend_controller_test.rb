require 'test_helper'

class FriendControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get show friends if logged" do
    sign_in users(:one)
    get friend_path id: users(:one)
    assert_response :success
  end

end
