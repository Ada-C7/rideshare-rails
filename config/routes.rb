Rails.application.routes.draw do
resources :riders do
  resources :trips
end

resources :drivers

root to: 'welcome#index'

# get 'riders', to: 'riders#index', as: 'riders'
# get 'riders/new', to: 'riders#new', as: 'new_rider'
# post 'riders', to: 'riders#create'
#
# get 'riders/:id', to: 'riders#show', as: 'rider'

end
