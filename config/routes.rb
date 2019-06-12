Rails.application.routes.draw do
  devise_for :users
  resources :reports do
    resources :comments, only: %i(create destroy), module: :reports
  end

  resources :books do
    resources :comments, only: %i(create destroy), module: :books
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
