Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :help_requests, only: [:create]
    resources :favorites, only: [:create]
  end
  resource :dashboard, only: [:show]
  resources :favorites, only: [:destroy]

  resources :help_requests, only: [:new, :update, :destroy, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :coupons, only: [:index]

  resources :user_coupons, only: [:create]
end
