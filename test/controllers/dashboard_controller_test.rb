require 'test_helper'

class DashboardControllerTest < ActionController::TestCase

  def setup
    # Get a random user through the fixtures, and sign in:
    sign_in User.all.sample
  end

  test 'should get dashboard ip addresses index' do
    get :index_addresses
    assert_response :success
  end

  test 'should get dashboard users index' do
    get :index_users
    assert_response :success
  end

end
