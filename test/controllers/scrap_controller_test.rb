require 'test_helper'

class ScrapControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scrap_index_url
    assert_response :success
  end

end
