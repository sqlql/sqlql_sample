require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
    @headers = { "Authorization" => "Token #{@like.user.key}" }
  end

  test "should create like" do
    assert_difference('Like.count') do
      post comment_likes_url(@like.comment), as: :json, headers: @headers
    end

    assert_response 201
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete like_url(@like), as: :json, headers: @headers
    end

    assert_response 204
  end
end
