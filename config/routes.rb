Rails.application.routes.draw do

  get 'dashboard/index_devices'
  root 'dashboard#index_devices'

end
