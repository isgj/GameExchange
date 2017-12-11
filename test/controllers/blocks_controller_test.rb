require 'test_helper'

class BlocksControllerTest < ActionDispatch::IntegrationTest
  test "create should require logged in user" do
    assert_no_difference 'Block.count' do
      post blocks_path
    end
    assert_redirected_to new_user_session_path
  end

  test "destroy should require logged in user" do
    assert_no_difference 'Block.count' do
      delete block_path(blocks(:one))
    end
    assert_redirected_to new_user_session_path
  end
end
