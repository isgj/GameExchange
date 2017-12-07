require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  def setup
    @request = Request.new(applier_id: users(:one).id,
                           recevier_id: users(:two).id)
  end

  test "should be valid" do
    assert @request.valid?
  end

  test "should require an applier id" do
    @request.applier_id = nil
    assert_not @request.valid?
  end

  test "should require a recevier id" do
    @request.recevier_id = nil
    assert_not @request.valid?
  end

  test "should send and remove request" do
    one = users(:one)
    two = users(:two)
    assert_not one.requests?(two)
    assert_not one.friends?(two)
    one.send_request(two)
    assert one.requests?(two)
    one.remove_request(two)
    assert_not one.requests?(two)
  end

  test "should send and refuse request" do
    one = users(:one)
    two = users(:two)
    assert_not one.requests?(two)
    assert_not one.friends?(two)
    one.send_request(two)
    assert one.requests?(two)
    assert two.requests.include?(one)
    two.refuses_request(one)
    assert_not one.requests?(two)
  end

  test "should send and accept request" do
    one = users(:one)
    two = users(:two)
    assert_not one.requests?(two)
    assert_not one.friends?(two)
    one.send_request(two)
    assert one.requests?(two)
    assert two.requests.include?(one)
    two.accept_request(one)
    assert one.friends?(two)
    assert_not one.requests?(two)
  end
end
