Rails.application.routes.draw do


  root 'welcome#index'

    #DRIVERS
      get 'drivers', to: 'drivers#index', as: 'drivers'

      get 'drivers/new', to: 'drivers#new', as: 'new_driver'
      post 'drivers', to: 'drivers#create'

      get 'drivers/:id', to: 'drivers#show', as: 'driver'
      get 'drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'

      patch 'drivers/:id', to: 'drivers#update'

      delete 'drivers/:id', to: 'drivers#destroy'


    #RIDERS
  resources :riders

  get 'riders/new'
  post 'riders' , to: "riders#create"

  delete 'riders/:id', to: 'riders#destroy'





 end
