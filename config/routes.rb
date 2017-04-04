Rails.application.routes.draw do

resources :passengers, except: [:new]
end
