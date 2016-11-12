Rails.application.routes.draw do

#this app was created by Ankush Malik github:  https://github.com/freakuency
 

  get '/professional_profile' => 'friendships#index'
  get 'ignore_friendships' => 'friendships#ignore'
  get '/friendships/destroy/:user_id' => 'friendships#destroy'
  get 'create_friendships' => 'friendships#create'
  get 'accept_friendships' => 'friendships#accept'
  root 'users#index'
  get '/users' => 'users#index'
  post '/users/register' => 'users#register'
  post '/users/login'
  post '/users' => 'users#logout'
  get '/users/show' => 'users#show_all'
  get "/users/:user_id" => "users#show"
  get '/slot1' => "slots#slot1"
  get '/slot2' => "slots#slot2"
end
