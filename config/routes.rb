Rails.application.routes.draw do

  root 'welcome#index'
  
  resources :trips
  resources :passengers
  resources :drivers
end
