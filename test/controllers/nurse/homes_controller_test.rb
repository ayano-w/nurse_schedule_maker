require 'test_helper'

class Nurse::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get nurse_homes_top_url
    assert_response :success
  end

end
