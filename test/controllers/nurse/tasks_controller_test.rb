require 'test_helper'

class Nurse::TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nurse_tasks_new_url
    assert_response :success
  end

  test "should get edit" do
    get nurse_tasks_edit_url
    assert_response :success
  end

end
