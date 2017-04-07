Rails.application.routes.draw do
root "welcome#index"

  get 'welcome/index'

resources :passengers

resources :trips
# get '/passengers/:id/trips/new', to: 'trips#new', as: 'new_passenger_trip'
# post '/passengers/:id/trips', to: 'trips#create', as: 'passenger_trips'


resources :drivers


end
