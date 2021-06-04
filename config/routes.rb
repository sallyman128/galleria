Rails.application.routes.draw do
  root "static#home"

  resources :paintings, only: [:index, :show] do
    resources :comments
  end

  resources :users, only: [:show, :new, :create, :destroy]

  get "/search", to: "paintings#search", as: "search_paintings"

  get "/signin", to: "sessions#signin"
  post "/login", to: "sessions#login"
  post "/logout", to: "sessions#logout"
  get '/auth/facebook/callback' => 'sessions#omniauth_login'

end
