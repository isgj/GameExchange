require 'test_helper'

class DesireTest < ActiveSupport::TestCase

  def setup
    @d = Desire.new({user: users(:one), game: games(:three), statuses: [1]})
  end

  test "should not save without user" do
    @d.user = nil
    assert_not @d.save
  end

  test "should not save without game" do
    @d.game = nil
    assert_not @d.save
  end

  test "should not save with wrong statuses" do
    # not nil
    @d.statuses = nil
    assert_not @d.save

    # not empty
    @d.statuses = []
    assert_not @d.save

    # unknown status
    @d.statuses = [5]
    assert_not @d.save

    # more statuses
    @d.statuses = [0, 1, 2, 3]
    assert_not @d.save
    assert @d.errors.count == 2
  end

end
