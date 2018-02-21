class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index_addresses
    @ip_addresses = IpAddress.order(updated_at: :desc)
  end

  def index_users
    @users = User.order(:email)
  end

end
