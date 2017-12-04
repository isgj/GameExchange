require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @u = users(:one)
    @u1 = users(:two)
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
      post gamer_comments_url(@u.id), params: { comment: { commentator_id: @u.id, commented_id: @u1.id, mark: @comment.mark, review: @comment.review } }
    end

    assert_redirected_to gamer_comments_url(@u)
  end

  test "should show comment" do
    get gamer_comment_url(@u,@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_gamer_comment_url(@u,@comment)
    assert_response :success
  end

  test "should update comment" do
    patch gamer_comment_url(@u,@comment), params: { comment: { commentator_id: @u.id, commented_id: @u.id, mark: @comment.mark, review: @comment.review } }
    assert_redirected_to gamer_url(@u)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete gamer_comment_url(@u,@comment)
    end

    assert_redirected_to gamer_url(@u)
  end
end
