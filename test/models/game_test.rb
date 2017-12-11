require 'test_helper'

class GameTest < ActiveSupport::TestCase
  def setup
    @g = Game.new
    @g.game_info = game_infos(:one)
    @g.owner = users(:one)
    @g.holder = users(:one)
    @g.platform = platforms(:one)
    @g.start_holding = Time.now
  end

  test "should not expire before holding" do
    @g.expire = 1.day.after
    @g.state = 4
    assert_not @g.save
  end

  # state 4 means rented
  test "should not rent without expire" do
    @g.state = 4
    assert_not @g.save
  end

  test "should not expire if no rent" do
    @g.state = 0
    @g.expire = 1.day.ago
    assert_not @g.save
  end
end
