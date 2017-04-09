Rails.application.routes.draw do

  get "/riders/:id/trips/new", to: 'trips#create', as: "new_rider_trip"

  post "/riders/:id/trips", to: 'trips#create'

  resources :drivers

  resources :riders

  root "trips#index" #root defaults to first one
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
