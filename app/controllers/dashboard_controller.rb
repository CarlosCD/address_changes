class DashboardController < ApplicationController

  def index_devices
    @devices = Device.order(:created_at)
  end

end
