Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'passengers#index'

resources :passengers

# need all restful routes?
resources :drivers

resources :trips, except: [:index, :new, :create]
post 'trips/:pid', to: 'trips#create', as: 'create_trip'

end
