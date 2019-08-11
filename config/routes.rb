Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "shakes#index"
  resources :shakes do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
