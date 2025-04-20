Rails.application.routes.draw do
  get "analytics/index"
  resources :tasks do
    resources :sessions, only: [:create, :destroy]
  end

  resources :focus_sessions, only: [:index, :new, :create, :update]

  get "/analytics", to: "analytics#index"

  root "tasks#index"
end