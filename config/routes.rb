Rails.application.routes.draw do
  root 'homes#index'

  post 'passengers/:passenger_id', to: 'trips#create', as: 'new_trip'
  patch 'drivers/:id/available', to: 'drivers#available', as: 'available_driver'
  patch 'trips/:id/rating', to: 'trips#rating', as: 'rating_trips'

  resources :passengers
  resources :drivers
  resources :trips, except: [:new, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
