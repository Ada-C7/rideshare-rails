Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :drivers
  resources :riders do
    resources :trips , only: [:new, :create]
  end

  resources :trips, except: [:new, :create]#, as:'rider_trips'
end
