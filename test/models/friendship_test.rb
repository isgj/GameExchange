require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase

  def setup
    @friendship = Friendship.new(friender_id: users(:one).id,
                                friended_id: users(:two).id)
  end

  test "should be valid" do
    assert @friendship.valid?
  end

  test "should require a friender id" do
    @friendship.friender_id = nil
    assert_not @friendship.valid?
  end

  test "should require a friended id" do
    @friendship.friended_id = nil
    assert_not @friendship.valid?
  end
#da completare per la parte di accettazione etc
  test "should friend and unfriend a user" do
    one = users(:three)
    two = users(:four)
    assert_not one.friends?(two)
    one.add_friend(two)
    assert one.friends?(two)
    one.unfriend(two)
    assert_not one.friends?(two)
  end
end
