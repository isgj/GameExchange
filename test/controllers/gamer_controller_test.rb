require 'test_helper'

class GamerControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    get gamers_path
    assert_response :success
  end

  test "should get show if logged" do
    sign_in users(:one)
    get gamer_path id: users(:one)
    assert_response :success
  end

  test "should not get show if not logged" do
    get gamer_path id: users(:one)
    assert_response :redirect
  end

  test "should get edit if logged and same" do
    sign_in users(:one)
    get edit_gamer_path id: users(:one)
    assert_response :success
  end

  test "should not get edit if not same" do
    sign_in users(:two)
    get edit_gamer_path id: users(:one)
    assert_response :redirect
  end

  test "should not get edit if not logged" do
    get edit_gamer_path id: users(:one)
    assert_response :redirect
  end

  test "should put update if logged and same" do
    sign_in users(:one)
    patch gamer_path(users(:one)), params:{gamer: {name: "Mattew", city: "Milan"}}
    assert_redirected_to gamer_path(users(:one))
  end

  test "should not put update if not same" do
    sign_in users(:two)
    patch gamer_path(users(:one)), params:{gamer: {name: "Mattew", city: "Milan"}}
    assert_redirected_to gamers_path
  end

  test "should put update if not logged" do
    patch gamer_path(users(:one)), params:{gamer: {name: "Mattew", city: "Milan"}}
    assert_redirected_to new_user_session_path
  end

  test "should redirect friends when not logged in" do
    get friends_gamer_path(users(:one))
    assert_redirected_to new_user_session_path
  end

  test "should redirect blocks when not logged in" do
    get blocks_gamer_path(users(:one))
    assert_redirected_to new_user_session_path
  end

  test "should delete user" do
    sign_in users(:admin)
    assert_difference('User.count', -1) do
      delete gamer_url(users(:delete_me))
    end

    assert_redirected_to gamers_path
  end

  test "should not delete another admin" do
    sign_in users(:admin)
    assert_no_difference 'User.count' do
      delete gamer_url(users(:delete_no))
    end
  end

  test "should promote user" do
    sign_in users(:admin)
    prom_user = users(:two)
    patch promote_gamer_url(prom_user)

    assert_redirected_to gamer_path(prom_user)
    assert User.find_by_id(prom_user.id).admin
  end

  test "should not promote another admin" do
    sign_in users(:admin)
    patch promote_gamer_url(users(:delete_no))

    assert_redirected_to root_path
  end
end
