Rails.application.routes.draw do
  root 'welcome#index', as:'welcome'

  resources :drivers
  resources :passengers
  resources :trips

end
