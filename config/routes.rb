Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :riders, :drivers
  resources :trips, except: [:new, :create]

  post '/riders/:rider_id/trips', to: 'trips#create', as: 'new_trip'

  root to: 'trips#index'

end
