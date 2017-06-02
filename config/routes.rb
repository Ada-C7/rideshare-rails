Rails.application.routes.draw do

  root 'passengers#index'
  resources :passengers
  resources :drivers
  resources :trips, except: [:new, :create]

  post '/passengers/:passenger_id/trips', to: 'trips#create', as: 'new_trip'
end
