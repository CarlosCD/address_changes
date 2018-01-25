require 'test_helper'

class DashboardControllerTest < ActionController::TestCase

  def setup
    # Get a random user through the fixtures, and sign in:
    sign_in User.all.sample
  end

  test 'should get dashboard index' do
    get :index_devices
    assert_response :success
  end

  test 'should get dashboard show device by id' do
    get :show_device, id: Device.all.sample.id
    assert_response :success
  end

  test 'should get dashboard show devices by serial number' do
    get :show_device, serial: Device.all.sample.serial_number
    assert_response :success
  end

end
