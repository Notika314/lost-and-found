Rails.application.routes.draw do
  resources :ratings
	get "items/index" , to: "items#index"
  post "users/create", to: "users#create"
  post "items/create", to: "items#create"
  delete "items/:id", to: "items#destroy"
  get "items/show", to: "items#show"
  post "sessions/login" ,to: "sessions#login"
  get "sessions/logout", to: "sessions#logout"
  root to: 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
