require 'test_helper'

class PlatformsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:admin)
    @p = platforms(:two)
  end

  test "should get show" do
    get platform_path(@p)
    assert_response :success
  end

  test "should get edit" do
    get edit_platform_path(@p)
    assert_response :success
  end

  test "should update" do
    patch platform_path(@p), params: {platform: {generation: 3}}
    assert_redirected_to platform_path(@p)
  end

  test "should not update api_id" do
    patch platform_path(@p), params: {platform: {api_id: 30}}
    assert_not 30 == platforms(:two).api_id
  end
end
