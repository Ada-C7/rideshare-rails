Rails.application.routes.draw do

  post 'passengers/:passenger_id', to: 'trips#create', as: 'new_trip'

  resources :passengers
  resources :drivers
  resources :trips, except: [:new, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
