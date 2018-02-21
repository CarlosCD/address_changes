require 'test_helper'

class ApiControllerTest < ActionController::TestCase

  test 'notify should be able to receive requests' do
    initial_num_data = IpAddress.count
    get :receive_ip_address
    assert_response :success
    assert_equal IpAddress.count, initial_num_data + 1
  end

end
