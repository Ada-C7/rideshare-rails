Rails.application.routes.draw do
  root "riders#index"
  resources :riders

  root "trips#index" #root defaults to first one
  resources :trips
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
