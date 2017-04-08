Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trips#index'

     post '/passengers/:id/create-trip', to: 'passengers#create_trip', as: 'passenger_create_trip'
     post 'trips/:id', to: 'trips#show'

     resources :drivers
     resources :passengers
     resources :trips
end
