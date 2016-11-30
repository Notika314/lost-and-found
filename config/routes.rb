Rails.application.routes.draw do
  root to: 'items#index'
  post "users/create", to: "users#create"
  get "items/show", to: "items#show"
  post "sessions/login" ,to: "sessions#login"
  get "sessions/logout", to: "sessions#logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
