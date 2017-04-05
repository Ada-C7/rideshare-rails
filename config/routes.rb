Rails.application.routes.draw do

  get 'drivers/index'

root "passengers#index"

resources :passengers
resources :drivers
resources :trips
end
