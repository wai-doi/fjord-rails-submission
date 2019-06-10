Rails.application.routes.draw do
  resources :reports do
    resources :comments, only: %i(create destroy)
  end

  resources :books do
    resources :comments, only: %i(create destroy)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
