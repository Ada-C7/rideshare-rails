Rails.application.routes.draw do
  root "drivers#index"

  resources :passengers do
      resources :trips
    end
    resources :drivers do
      resources :trips
  end
end
