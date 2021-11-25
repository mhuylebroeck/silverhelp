Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :index] do
    # IF THERE IS A CONFLICT DELETE THE ONLY METHOD HERE, THIS IS ONLY FOR TESTING!!!
    resources :help_requests, only: [:create]
  end
  resource :dashboard, only: [:show]
  resources :help_requests, only: [:new, :update]
end
