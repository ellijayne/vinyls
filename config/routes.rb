Rails.application.routes.draw do

root :to => 'pages#home'
    get '/users/profile' => 'users#profile'
    resources :users, :only => [:index, :show, :new, :create] do
      # TODO: READ ABOUT NESTED ROUTES in RAILS GUIDE
      #this is doing 'read' part of favourites
      get '/favourite_albums' => 'users#favourite_albums'
      get '/favourite_artists' => 'users#favourite_artists'

      #this is doing 'create' part of favourites
      post '/favourite_albums/add' => 'users#add_to_favourite_albums'
      post '/favourite_artists/add' => 'users#add_to_favourite_artists'

      #this is destroy/delete part
      delete '/favourite_albums/:album_id' => 'users#destroy_favourite_album', :as => :favourite_album_destroy

      delete '/favourite_artists/:artist_id' => 'users#destroy_favourite_artist', :as => :favourite_artist_destroy
    end

    resources :albums, :only => [:index, :show, :new, :create, :edit, :update, :delete] do
      get '/pressings' => 'pressings#album_index'
    end

    resources :artists, :only => [:index, :show, :new, :create, :edit, :update, :delete]
    resources :pressings, :only => [:index, :show, :new, :create]

    # resources :search, only: =>  [:index]

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
