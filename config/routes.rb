Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :drivers
  get '/trips/:id/rating', to: 'trips#edit_rating', as: 'edit_rating'
  # patch '/trips/:id', to: 'trips#update'
  resources :trips

end
