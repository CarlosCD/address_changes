require 'test_helper'

class DashboardControllerTest < ActionController::TestCase

  test "should get dashboard index" do
    get :dashboard_index
    assert_response :success
  end

  test "should get dashboard show by id" do
    get :dashboard_show, id: Device.all.sample.id
    assert_response :success
  end

  test "should get dashboard show by serial" do
    get :dashboard_show, serial: Device.all.sample.serial_number
    assert_response :success
  end

end
