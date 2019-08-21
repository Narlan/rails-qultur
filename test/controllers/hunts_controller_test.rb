require 'test_helper'

class HuntsControllerTest < ActionDispatch::IntegrationTest
  test "should get scanned" do
    get hunts_scanned_url
    assert_response :success
  end

end
