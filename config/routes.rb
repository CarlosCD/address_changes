Rails.application.routes.draw do

  get 'dashboard/devices' => 'dashboard#index_devices'
  get 'dashboard/device/:id' => 'dashboard#show_device', as: :dashboard_device
  get 'dashboard/device_by_serial/:serial' => 'dashboard#show_device'

  get 'dashboard/remove_alert/:data_id' => 'dashboard#remove_alert', as: :remove_alert

  root 'dashboard#index_devices'

end
