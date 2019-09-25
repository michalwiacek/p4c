require "test_helper"

class ApiTest < ActionDispatch::IntegrationTest
  test "creates verticals" do
    assert_difference -> { Vertical.count } do
      post api_v1_verticals_path, params: { vertical: { name: "Ahoy!" } }, as: :json
    end
    
    assert_response :success
    assert_equal({ "id"=>Vertical.last.id, "name"=>"Ahoy!" }, response.parsed_body.dig("body","data","attributes"))
  end

  test "get verticals" do
    get api_v1_verticals_path, as: :json
    assert_response :success
  end
end