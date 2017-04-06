Rails.application.routes.draw do

resources :passengers, except: [:new]
resources :trips
resources :drivers
end
