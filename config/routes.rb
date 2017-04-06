Rails.application.routes.draw do
root "welcome#index"

  get 'welcome/index'

resources :passengers
resources :trips
resources :drivers


end
