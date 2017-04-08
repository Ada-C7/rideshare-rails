Rails.application.routes.draw do
  get 'riders/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'drivers#index'

  resources :drivers
  resources :riders
  resources :trips, except: [:create, :new]

  post 'riders/:id/create_trip', to: 'trips#create', as: 'create_trip'
  post 'drivers/:id', to: 'drivers#available', as: 'available_driver'
  post 'drivers/:id', to: 'drivers#offline', as: 'offline_driver'

end
