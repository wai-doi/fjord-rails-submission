Rails.application.routes.draw do
  root 'reports#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :users, only: %i(index show update)
  resources :users, only: :show do
    resources :followings, only: :index, module: :users
    resources :followers, only: :index, module: :users
  end

  resources :relationships, only: %i(create destroy)

  resources :reports do
    resources :comments, only: %i(create destroy), module: :reports
  end

  resources :books do
    resources :comments, only: %i(create destroy), module: :books
  end
end
