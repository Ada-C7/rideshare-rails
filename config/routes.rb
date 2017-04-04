Rails.application.routes.draw do
  resources :trips
  resources :passengers
  resources :drivers
end
