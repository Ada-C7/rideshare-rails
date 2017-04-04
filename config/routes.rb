Rails.application.routes.draw do


    #DRIVERS
      get 'drivers', to: 'drivers#index', as: 'drivers'
      get 'drivers/:id', to: 'drivers#show', as: 'driver'


    #RIDERS
  resources :riders

  get 'riders/new'
  post 'riders' , to: "riders#create"

  delete 'riders/:id', to: 'riders#destroy'





 end
