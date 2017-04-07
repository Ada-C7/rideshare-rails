Rails.application.routes.draw do

  root "rideshare#index"

  resources :passengers
  resources :drivers
  resources :trips
  
end
