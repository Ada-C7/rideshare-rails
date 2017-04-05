Rails.application.routes.draw do
  # get 'passengers/index'
  #
  # get 'drivers/index'
resources :trips, only:[:index]
  # get 'trips' to: 'trips#index', as: 'trips'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
