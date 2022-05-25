Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :offers do
    resources :reservations, only: %i[new]
  end
  resources :reservations, only: %i[index create edit update destroy show]
  post "reservations/:id/accept", to: "reservations#accept", as: :accept_reservation
  post "reservations/:id/decline", to: "reservations#decline", as: :decline_reservation
  # Defines the root path route ("/")
  # root "articles#index"
end
