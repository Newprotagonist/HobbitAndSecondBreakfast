Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :offers do
    resources :reservations, only: %i[new create edit update]
  end
  resources :reservations, only: %i[index destroy show] do
    resources :reviews, only: %i[new create]
  end
  post "reservations/:id/accept", to: "reservations#accept", as: :accept_reservation
  post "reservations/:id/decline", to: "reservations#decline", as: :decline_reservation
  get "/profile", to: "profiles#profile"
end
