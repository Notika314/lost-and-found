Rails.application.routes.draw do
  resources :ratings
  resources :items do 
  	resources :comments
  end
  post "comments/", to: "comments#create"
	get "items" , to: "items#index"
  post "users/create", to: "users#create"
  post "items/create", to: "items#create"
  get "items/deleted_message", to: "items#deleted_message"
  delete "items", to: "items#destroy"
  get "items/show", to: "items#show"
  post "sessions/login" ,to: "sessions#login"
  get "sessions/logout", to: "sessions#logout"
  get "items/external_api",to: "items#api"
  root to: 'items#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
