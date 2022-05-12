require "test_helper"

class Api::FlightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_flights_index_url
    assert_response :success
  end
end
