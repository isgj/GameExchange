require 'test_helper'

class QueryControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    sign_in users(:one)
  end

  test "should get index" do
    get queries_url
    assert_response :success
  end

  test "should get new" do
    get query_url(queries(:one))
    assert_response :success
  end

  test "should get show" do
    get query_url(queries(:one))
    assert_response :success
  end
end
