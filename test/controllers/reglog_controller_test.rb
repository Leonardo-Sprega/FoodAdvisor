require "test_helper"

class ReglogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reglog_index_url
    assert_response :success
  end
end
