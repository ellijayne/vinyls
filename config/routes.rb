Rails.application.routes.draw do

root :to => 'pages#home'
    get '/users/profile' => 'users#profile'
    resources :users, :only => [:index, :show, :new, :create]
    resources :albums, :only => [:index, :show, :new, :create]
    resources :artists, :only => [:index, :show, :new, :create]
    #TODO add index too later!
    resources :pressings, :only => [:new, :create]

  # get 'session/new' #DONT KNOW WHERE THIS CODE CAME FroM?
  # get 'pages/home'
  # get 'users/new'

  #the above line is the same as:::::
    # get '/users/new' => 'users#new'
    # post '/users' => 'users#create'

    get '/login' => 'session#new' #login form
    post '/login' => 'session#create' #perform the login
    delete '/login' => 'session#destroy' #perform signout/'delete' the signin

end
