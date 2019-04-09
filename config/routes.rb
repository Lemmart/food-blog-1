Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  # resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # match '/auth/:provider/callback', :to => 'sessions#create'
  # match '/auth/failure', :to => 'sessions#failure'
  resources :posts do
    resources :comments
  end
  root "posts#index"
end
