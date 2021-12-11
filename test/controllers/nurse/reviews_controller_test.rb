require 'test_helper'

class Nurse::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nurse_reviews_index_url
    assert_response :success
  end

  test "should get edit" do
    get nurse_reviews_edit_url
    assert_response :success
  end

end
