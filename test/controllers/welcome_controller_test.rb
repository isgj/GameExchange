require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index root" do
    get root_url
    assert_response :success
  end

end
