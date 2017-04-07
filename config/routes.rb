Rails.application.routes.draw do
  get 'riders/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'drivers#index'

  resources :drivers
  resources :riders
  resources :trips, except: [:create, :new]

  # get 'riders/:id/new_trip', to: 'trips#new', as: 'new_trip'
  post 'riders/:id/create_trip', to: 'trips#create', as: 'create_trip'

end
