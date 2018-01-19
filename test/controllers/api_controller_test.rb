require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get notify" do
    get :notify
    assert_response :success
  end

end
