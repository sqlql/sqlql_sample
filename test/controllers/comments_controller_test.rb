require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
    @headers = { "Authorization" => "Token #{@comment.user.key}" }
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { content: @comment.content, privacy: @comment.privacy, user_id: @comment.user_id } }, as: :json, headers: @headers
    end

    assert_response 201
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { content: @comment.content, privacy: @comment.privacy, user_id: @comment.user_id } }, as: :json, headers: @headers
    assert_response 200
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment), as: :json, headers: @headers
    end

    assert_response 204
  end
end
