Rails.application.routes.draw do
    resources :drivers
    resources :riders
    resources :trips, only: [:show, :edit, :destroy]

    post 'riders/:id/new_trip', to: 'riders#new_trip', as: 'new_trip'
end
