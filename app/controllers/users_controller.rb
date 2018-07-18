class UsersController < ApplicationController

  before_action :check_for_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params #this will create user var but not in the DB
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      #TODO change above redirect so user is redirected to their 'dashboard' once they create their account
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def favourite_albums
    @user = User.find params[:user_id]
    @favourite_albums = @user.albums
  end

  def favourite_artists
    @user = User.find params[:user_id]
    @favourite_artists = @user.artists
  end

  def add_to_favourite_albums
    album = Album.find params[:album_id]
    @current_user.albums << album
    redirect_to user_favourite_albums_path(@current_user)
  end

  def add_to_favourite_artists
    artist = Artist.find params[:artist_id]
    @current_user.artists << artist
    redirect_to user_favourite_artists_path(@current_user)
  end

  def destroy_favourite_album
    @current_user.albums.destroy(params[:album_id])
    redirect_to user_favourite_albums_path(@current_user)
  end

  def destroy_favourite_artist
    @current_user.artists.destroy(params[:artist_id])
    redirect_to user_favourite_artists_path(@current_user)
  end


  def profile
    @user = @current_user
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
