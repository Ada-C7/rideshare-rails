Rails.application.routes.draw do


    #DRIVERS
      get 'drivers', to: 'drivers#index', as: 'drivers'
      get 'drivers/:id', to: 'drivers#show', as: 'driver'


    #RIDERS
  resources :riders
    # member do
    #   get :delete
    # end





 end
