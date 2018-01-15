require 'test_helper'

class DesiresControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get desires_url
    assert_response :success
  end

  test "should create request" do
    @game = games(:three)
    assert_difference('Desire.count') do
      post game_desires_url(@game), params: { status1: 1 }
    end

    assert_redirected_to game_url(@game)
  end

  test "should update request" do
    @game = games(:two)
    patch game_desire_url(@game, desires(:one)), params: { status1: 1, status2: 1 }
    assert_redirected_to game_url(@game)
  end

  test "should delete request" do
    @game = games(:two)
    assert_difference('Desire.count', -1) do
      delete game_desire_url(@game, desires(:one))
    end

    assert_redirected_to game_url(@game)
  end

  test "should show request" do
    get desire_url(desires(:two))
    assert_response :success
  end

  test "should accept request" do
    @game = games(:one)
    assert_difference('Desire.count', -1) do
      patch accept_game_desire_url(@game, desires(:two)), params: {status: '1'}
    end

    assert_redirected_to game_url(@game)
  end
end
