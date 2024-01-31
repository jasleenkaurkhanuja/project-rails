Rails.application.routes.draw do
  get 'files/index'
  get 'files/create'
  get 'files/destroy'
  get 'files/update'
  post '/user/register', to: "user#register"
  post '/user/login', to: "user#login"
  post '/user/logout', to:"user#logout"
  get '/user', to:"user#index"
  delete '/user/:id', to:"user#destroy"

  get '/tasks', to:'tasks#index'
  post '/tasks', to:'tasks#create'
  patch '/tasks/:id', to:'tasks#update'
  delete '/tasks/:id', to:'tasks#delete'
  get '/tasks/:id', to:'tasks#show'

  get '/weather/:city', to:'weather#show'
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
