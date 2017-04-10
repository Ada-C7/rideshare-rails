Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "rideshare#index"

  resources :riders do
    resources :trips
  end
  resources :drivers
  resources :trips
end
