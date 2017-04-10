Rails.application.routes.draw do
  get 'riders/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'mains#index'

  resources :drivers
  resources :riders
  resources :trips, except: [:create, :new]

  post 'riders/:id/create_trip', to: 'trips#create', as: 'create_trip'


  post 'drivers/:id', to: 'drivers#change_availability', as: 'change_driver_status'

  # post 'drivers/:id', to: 'drivers#available', as: 'available_driver'
  # rails just reading the offline driver route, and not the available driver route :/


end
