Rails.application.routes.draw do
  get 'driver/index'

  get 'driver/new'

  get 'driver/update'

  get 'driver/delete'

  get 'driver/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/drivers/:id/edit", to: "drivers#edit", as: 'edit_driver'
  patch "/drivers/:id", to: "drivers#update"

  delete "/drivers/:id", to: "drivers#destroy", as: "delete_driver"

  resources :drivers, except: [:edit, :update, :delete]


  resources :users
  resources :trips

end
