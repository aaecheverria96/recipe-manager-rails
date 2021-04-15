Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
  root to: 'sessions#create' 
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get "/login", to: "sessions#new" 
  post "/login", to: "sessions#create" 
  post "/logout", to: "sessions#destroy"   
  get "/signup", to: "users#new" 

  
  resources :recipes, only: [:show, :create, :new, :edit, :update, :index, :destroy]  
  resources :users, only: [:show, :create, :edit, :update]  
  
  
  

end
