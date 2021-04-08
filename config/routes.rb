Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
  get "/login", to: "sessions#new" 
  post "/login", to: "sessions#create" 
  post "/logout", to: "sessions#destroy"  
  get "/signup", to: "users#new" 
  post "/users", to: "users#create" 
  
  

end
