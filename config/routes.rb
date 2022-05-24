Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :offers do
    resources :reservations, only: %i[new create]
  end
  resources :reservations, only: %i[index edit update destroy show]
  # Defines the root path route ("/")
  # root "articles#index"
end
