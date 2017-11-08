require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save another user with the same email" do
    user = User.new
    user.email = "one@example.com"
    user.password = "password"
    assert_raises(ActiveRecord::RecordInvalid) { user.save! }
  end
end
