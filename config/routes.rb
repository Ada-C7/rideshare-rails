Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :passengers

# need all restful routes?
resources :drivers

resources :trips, except: :index

end
