Rails.application.routes.draw do
  root 'welcome#index', as: 'welcome'

resources :trips, only:[:index, :show, :new, :create]
resources :welcome, only:[:index, :show]
resources :drivers, only:[:index, :show]
resources :passengers, only: [:index, :show, :new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
