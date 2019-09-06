Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shakes do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
