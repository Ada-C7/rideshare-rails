Rails.application.routes.draw do


  root 'welcome#index'

    #DRIVERS
    resources :drivers do


  end

      # get 'drivers', to: 'drivers#index', as: 'drivers'
      #
      # get 'drivers/new', to: 'drivers#new', as: 'new_driver'
      # post 'drivers', to: 'drivers#create'
      #
      # get 'drivers/:id', to: 'drivers#show', as: 'driver'
      # get 'drivers/:id/edit', to: 'drivers#edit', as: 'edit_driver'
      #
      #
      # patch 'drivers/:id', to: 'drivers#update'
      # delete 'drivers/:id', to: 'drivers#destroy'


    #RIDERS
    resources :riders do
      resources :trips do
        member do

          get  'complete_trip'
          post 'complete_trip'
        end
      end


    end








end
