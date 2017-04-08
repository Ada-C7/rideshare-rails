Rails.application.routes.draw do

  resources :passengers do
      resources :trips
    end
    resources :drivers do
      resources :trips
  end
end
