Rails.application.routes.draw do
  resources :riders do
    resources :trips, only: [:new, :create]
  end
  resources :drivers
  resources :trips, except: [:new, :create]
end
