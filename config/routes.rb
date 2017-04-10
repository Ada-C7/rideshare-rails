Rails.application.routes.draw do

  root "trips#index" #root defaults to first one

  get "/riders/:id/trips/new", to: 'trips#new', as: "new_rider_trip"

  post "/riders/:id/trips", to: 'trips#create'

  patch "drivers/:id", to: "drivers#update_active", as: "update_active_driver"

  patch "riders/:id", to: "riders#update_active", as: "update_active_rider"

  resources :drivers

  resources :riders

  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
