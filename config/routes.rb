Rails.application.routes.draw do

  post 'api/v1/notify' => 'api#notify'

  devise_for :users
  get 'dashboard/users' => 'dashboard#index_users'
  get 'dashboard/toggle_user_login/:user_id' => 'dashboard#toggle_user_login', as: :toggle_user_login

  get 'dashboard/devices' => 'dashboard#index_devices'
  get 'dashboard/device/:id' => 'dashboard#show_device', as: :dashboard_device
  get 'dashboard/device_by_serial/:serial' => 'dashboard#show_device'
  get 'dashboard/remove_alert/:data_id' => 'dashboard#remove_alert', as: :remove_alert

  root 'dashboard#index_devices'

end
