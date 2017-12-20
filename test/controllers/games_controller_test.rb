require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @game = games(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should not get index of gamer if logged out" do
    sign_out @user
    get games_url, params: {gamer: @user.id}
    assert_redirected_to root_url
  end

  test "should get new" do
    get new_game_url, params: {game_info: game_infos(:one).id}
    assert_response :success
  end

  test "should create game" do
    g_i = game_infos(:one).id
    platform = platforms(:one).id
    assert_difference('Game.count') do
      post games_url, params: { game: { platform: platform, note: 'new' }, game_info: g_i }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should not create game without title" do
    platform = platforms(:one).id
    assert_no_difference('Game.count') do
      post games_url, params: { game: { platform: platform, note: 'new' }, game_info: 1 }
    end

    assert_redirected_to titles_url
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), xhr: true, params: { game: {state: 3} }
    assert_equal 3, Game.find(@game.id).state
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete game_url(@game)
    end

    assert_redirected_to gamer_url(@user)
  end
end
