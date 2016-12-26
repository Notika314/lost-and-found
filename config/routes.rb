Rails.application.routes.draw do
  resources :ratings
  get "items/external_api",to: "items#api"
  get "items/search_by_keyword", to: "items#keyword_search"
  post "items/search_by_keyword", to: "items#keyword_search"
  post "comments/", to: "comments#create"
  get "items" , to: "items#index"
  post "users/create", to: "users#create"
  post "items/create", to: "items#create"
  get "items/deleted_message", to: "items#deleted_message"
  delete "items", to: "items#destroy"
  get "items/show", to: "items#show"
  post "sessions/login" ,to: "sessions#login"
  get "sessions/logout", to: "sessions#logout"
  resources :items do 
    resources :comments
  end
  root to: 'items#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
