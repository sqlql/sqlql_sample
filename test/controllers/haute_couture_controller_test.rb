require 'test_helper'

class HauteCoutureControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @headers = { "Authorization" => "Token #{@user.key}"}
  end

  test "should get query result" do
    query = <<~SQL
      SELECT * FROM users
    SQL
    get haute_couture_url, params: { haute_couture: { query: query } }, headers: @headers

    assert_response 200
  end
end
