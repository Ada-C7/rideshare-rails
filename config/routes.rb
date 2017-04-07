Rails.application.routes.draw do
  resources :drivers

  resources :riders

  root "trips#index" #root defaults to first one
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/riders/:id/trips/new", to: 'trips#new', as: "new_rider_trip"

post "/riders/:id/trips", to: 'trips#create'

end
