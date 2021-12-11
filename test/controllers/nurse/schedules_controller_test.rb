require 'test_helper'

class Nurse::SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get nurse_schedules_show_url
    assert_response :success
  end

  test "should get index" do
    get nurse_schedules_index_url
    assert_response :success
  end

  test "should get create" do
    get nurse_schedules_create_url
    assert_response :success
  end

  test "should get destroy" do
    get nurse_schedules_destroy_url
    assert_response :success
  end

end
