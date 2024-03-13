Rails.application.routes.draw do
  get '/attachments', to:'attachments#index' #get all the attachments of all the users
  post '/attachments', to:'attachments#create' #post an attachment for a particular user 
  get 'attachments/show', to:'attachments#show' #get all the attachments of a particular user
  get '/attachments/:id', to:'attachments#showparticular' #get a partucular attachment of a particular user
  delete '/attachments/:id', to:'attachments#destroy' #delete a particular attachment of a particular user
  patch '/attachments/:id', to:'attachments#update' #patch a particular attachment of a particular user

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
