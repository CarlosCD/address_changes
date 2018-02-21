Rails.application.routes.draw do

  get 'notify' => 'api#receive_ip_address'

  devise_for :users

  get 'dashboard/users'  => 'dashboard#index_users'
  get 'dashboard/alerts' => 'dashboard#index_addresses'
  root 'dashboard#index_addresses'

end
