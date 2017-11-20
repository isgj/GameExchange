require 'test_helper'

class GamerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gamers_path
    assert_response :success
  end

  test "should get show" do
    get gamer_path id: users(:one)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamer_path id: users(:one)
    assert_response :success
  end

  test "should put update" do
    patch gamer_path(users(:one)), params:{gamer: {name: "Mattew", city: "Milan"}}
    assert_redirected_to gamer_path(users(:one))
  end
end
