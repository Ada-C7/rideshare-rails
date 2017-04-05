Rails.application.routes.draw do
  get 'riders/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
  root 'drivers#index'

  resources :drivers
=======
  resources :riders
>>>>>>> eca214477b6b54e748476ee8f8d33f35d59328a2
end
