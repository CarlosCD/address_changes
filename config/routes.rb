Rails.application.routes.draw do

  get 'dashboard/devices' => 'dashboard#index_devices'
  get 'dashboard/device/:id' => 'dashboard#show_device', as: :dashboard_device
  get 'dashboard/device_by_serial/:serial' => 'dashboard#show_device'

  root 'dashboard#index_devices'

end
