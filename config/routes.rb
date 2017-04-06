Rails.application.routes.draw do

  get 'trips/index'

  resources :drivers
  resources :passengers

end
