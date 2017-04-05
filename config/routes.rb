Rails.application.routes.draw do
  get 'riders/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'drivers#index'

  resources :drivers
  resources :riders
  resources :trips

end
