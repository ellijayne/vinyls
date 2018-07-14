Rails.application.routes.draw do

  get 'users/new'
  resources :users, :only => [:new, :create]
  #the above line is the same as::::: 
    # get '/users/new' => 'users#new'
    # post '/users' => 'users#create'

end
