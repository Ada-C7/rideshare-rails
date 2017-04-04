Rails.application.routes.draw do

  root 'passengers#index'
  resources :passengers
  resources :drivers
  resources :trips
  
end
