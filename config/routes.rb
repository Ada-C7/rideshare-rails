Rails.application.routes.draw do
  get 'driver/index'

  get 'driver/new'

  get 'driver/update'

  get 'driver/delete'

  get 'driver/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/drivers/:id/edit", to: "drivers#edit", as: 'edit_task'
  patch "/drivers/:id", to: "drivers#update"

  resources :drivers, except: [:edit, :update]


  resources :users
  resources :trips

end
