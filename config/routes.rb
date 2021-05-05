Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
  root to: 'sessions#create' 
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get "/login", to: "sessions#new" 
  post "/login", to: "sessions#create" 
  post "/logout", to: "sessions#destroy"   
  get "/signup", to: "users#new" 
  post "/signup", to: "users#new" 
  get '/recipes/search', to: 'recipes#search' 
  get '/favorites', to: 'recipes#favorites'  
  patch '/favorites/:id/like', to: 'recipes#make_favorites', as: 'like' 
  
  
  resources :users, only: [:show, :index] do
    # nested resource for resources 
    resources :recipes, only: [:new, :show, :index, :new, :create] 
  end
  
  
  
  resources :recipes, only: [:show, :create, :new, :edit, :update, :index, :destroy] 
  resources :users, only: [:show, :create, :edit, :update, :myrecipes]  
  resources :comments, only: [:new, :create]  
  
  
  

end
