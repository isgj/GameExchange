require 'test_helper'

class TitlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:one)
    @g = game_infos(:one)
  end

  test "should get titles" do
    get titles_url
    assert_response :success
  end

  test "should get one title" do
    get title_url(@g)
    assert_response :success
  end

  test "should edit title" do
    sign_out users(:one)
    sign_in users(:admin)
    get edit_title_path(@g)
    assert_response :success
  end

  test "should update game" do
    sign_out users(:one)
    sign_in users(:admin)
    patch title_path(@g), params: {title: {summary: 'Some text'}}
    assert_redirected_to title_path(@g)
  end
end
