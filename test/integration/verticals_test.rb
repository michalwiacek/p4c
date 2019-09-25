require "test_helper"

class VerticalsTest < ActionDispatch::IntegrationTest
  def test_GET_posts_returns_verticals
    get api_v1_verticals_path, as: :json
    assert_equal response.status, 200
    assert_matches_json_schema response, "verticals"
  end
end