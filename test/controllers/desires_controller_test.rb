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

  test "should create requeste" do
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

  test "should delete requeste" do
    @game = games(:two)
    assert_difference('Desire.count', -1) do
      delete game_desire_url(@game, desires(:one))
    end

    assert_redirected_to game_url(@game)
  end
end
