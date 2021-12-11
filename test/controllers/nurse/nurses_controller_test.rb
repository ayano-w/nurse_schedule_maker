require 'test_helper'

class Nurse::NursesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get nurse_nurses_show_url
    assert_response :success
  end

end
