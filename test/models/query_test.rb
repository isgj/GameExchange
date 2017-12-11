require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "should not save same query" do
    q = Query.new(query: "Game")
    assert_raises(ActiveRecord::RecordNotUnique) { q.save! }
  end
end
