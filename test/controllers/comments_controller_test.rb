require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @u = users(:one)
    @comment = comments(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get gamer_comments_url(@u)
    assert_response :success
  end

  test "should get new" do
    get new_gamer_comment_url(@u)
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { commentator_id: @comment.commentator_id, commented_id: @comment.commented_id, mark: @comment.mark, review: @comment.review } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get gamer_comment_url(@u,@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamer_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { commentator_id: @comment.commentator_id, commented_id: @comment.commented_id, mark: @comment.mark, review: @comment.review } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete gamer_comment_url(@u,@comment)
    end

    assert_redirected_to comments_url
  end
end
