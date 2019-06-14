Rails.application.routes.draw do
  root 'reports#index'
  devise_for :users
  resources :users, only: %i(index show update)
  resources :reports do
    resources :comments, only: %i(create destroy), module: :reports
  end

  resources :books do
    resources :comments, only: %i(create destroy), module: :books
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
