Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'riders', to: 'riders#index', as: 'riders'
get 'riders/new', to: 'riders#new', as: 'new_rider'
post 'riders', to: 'riders#create'

end
