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
    get 'riders', to: 'riders#index', as: 'riders'

    get 'riders/new', to: 'riders#new', as: 'new_rider'
    post 'riders', to: 'riders#create'

    get 'riders/:id', to: 'riders#show', as: 'rider'
    get 'riders/:id/edit', to: 'riders#edit', as: 'edit_rider'

    patch 'riders/:id', to: 'riders#update'

    delete 'riders/:id', to: 'riders#destroy'





 end
