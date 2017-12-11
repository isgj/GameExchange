require 'test_helper'

class TitlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    sign_in users(:one)
  end

  test "should get titles" do
    get titles_url
    assert_response :success
  end

  test "should get one title" do
    get title_url(game_infos(:one))
    assert_response :success
  end
end
