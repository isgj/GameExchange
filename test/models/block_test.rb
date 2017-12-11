require 'test_helper'

class BlockTest < ActiveSupport::TestCase
  def setup
    @block = Block.new(blocker_id: users(:one).id, blocked_id: users(:two).id)
  end

  test "should be valid" do
    assert @block.valid?
  end

  test "should require a blocker id" do
    @block.blocker_id = nil
    assert_not @block.valid?
  end

  test "should require a blocked id" do
    @block.blocked_id = nil
    assert_not @block.valid?
  end

  test "should block and unblock a user" do
    one = users(:one)
    two = users(:two)
    assert_not one.blocking?(two)
    one.block(two)
    assert one.blocking?(two)
    assert two.blockers.include?(one)
    one.unblock(two)
    assert_not one.blocking?(two)
  end
end
