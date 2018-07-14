Rails.application.routes.draw do

  get 'session/new'
  get 'pages/home'
  get 'users/new'
  resources :users, :only => [:new, :create]
  #the above line is the same as:::::
    # get '/users/new' => 'users#new'
    # post '/users' => 'users#create'

    get '/login' => 'session#new' #login form
    post '/login' => 'session#create' #perform the login
    delete '/login' => 'session#delete' #perform signout/'delete' the signin

end
